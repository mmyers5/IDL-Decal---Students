pro set_seed
    ; Seed for use with the random number gernerator.
    common seedvar, seed, colorseed
    seed      = long(systime(/seconds))
    colorseed = long(systime(/seconds))
end

function get_path, diffusivity, time_step, nsteps, ndim
    ; This function gets the path of a particle undergoing brownian motion

    ; Get the global seed
    common seedvar 

    if ndim ne 1 and ndim ne 2 and ndim ne 3 then begin
        print, 'Invalid dimensions'
        return, 0
    endif

    ; Get the path of the particle
    xsteps = randomn(seed, nsteps) * 2 * ndim * diffusivity * time_step
    ysteps = randomn(seed, nsteps) * 2 * ndim * diffusivity * time_step
    zsteps = randomn(seed, nsteps) * 2 * ndim * diffusivity * time_step
    xpath  = total(xsteps, /cumulative)
    ypath  = total(ysteps, /cumulative)
    zpath  = total(zsteps, /cumulative)

    ; Prepare the return variables
    case ndim of
        1: path = [[xpath], [findgen(nsteps)+1]] ; force array to be 2D
        2: path = [[xpath], [ypath]]
        3: path = [[xpath], [ypath], [zpath]]
    endcase

    return, path
end

function add_flow, velocity, time_step, paths
    ; This function adds bulk flow to brownian motion paths
    ndim = n_elements(velocity)
    arrsize = size(paths)
    nsteps = arrsize[1]
    
    ; Add the flow components
    range = time_step * (findgen(nsteps) + 1)
    for i = 0, ndim-1 do begin
        paths[*, i] += range * velocity[i]
    endfor

    return, paths
end

function frame_filename, tmpdir, iter, nsteps
    ; This function just generates the filenames of the frames
    nzeros = fix(alog10(nsteps)) - fix(alog10(iter))
    zeros = ""
    for i = 1, nzeros do begin
        zeros = zeros + '0'
    endfor

    ; Add everything together
    filename = tmpdir + "/tmpimg-" + zeros + string(iter) + ".png"
    return, repstr(filename, " ", "")
end

pro create_frames, diffusion, paths, nparticles, nsteps, ndim, tmpdir, display
    ; This procedure creates and saves all of the frames in the animation

    ; I need the global RNG seeds
    common seedvar

    ; Get each dimension out of the path data
    case 1 of 
        ndim eq 1:  begin
            xdata = paths[*, 1]
            ydata = paths[*, 0]
            end
        ndim eq 2 or ndim eq 3:  begin
            xdata = paths[*, 0]
            ydata = paths[*, 1]
            if ndim eq 3 then begin
                zdata = paths[*, 2]
            endif
            end
    endcase

    ; Generate the colors
    rgbcols = []
    for i = 1, nparticles do begin
        rgbcols = [rgbcols, fix(256 * randomu(colorseed, 3))]
    endfor

    ; Create the frames
    for i = 1, nsteps-1 do begin
        filename = frame_filename(tmpdir, i, nsteps)
        for j = 0, nparticles-1 do begin
            ; Extract the data 
            xsub = xdata[j*nsteps:j*nsteps+i]
            ysub = ydata[j*nsteps:j*nsteps+i]
            col  = rgbcols[j*3:j*3+2]

            ; Plot the data
            if ndim eq 3 then begin
                zsub = zdata[j*nsteps:j*nsteps+i]
                p = plot3d(xsub, ysub, zsub, color=col, buffer=1, /overplot)
            endif else begin
                p = plot(xsub, ysub, color=col, buffer=1, /overplot)
            endelse
        endfor

        ; Format the axis labels
        p.xtitle = "X (cm)"
        p.ytitle = "Y (cm)"
        if ndim eq 3 then begin
            p.ztitle = "Z (cm)"
        endif
        title = "D = " + string(diffusion) + "cm^2/s"
        p.title = repstr(repstr(repstr(title, " ", ""), "=", " = "), "c", " c")

        ; Save each frame
        progstr = repstr(string(i) + "/" + string(nsteps - 1), " ", "")
        print, "Saving image frame: ", repstr(progstr, "/", " / ")
        p.save, filename, resolution=100
        p.close
    endfor
end

pro help_main
    ; This displays the basic usage of the main function from the idl prompt
    helpstr  = "params: outfile, nparticles, nsteps, ndim, "
    helpstr += "time_step, diffusion, bulk_flow, display"
    print, helpstr
end

pro main, outfile, nparticles, nsteps, ndim, time_step, diffusion, bulk_flow, display
    ; Set up the RNG
    set_seed 

    ; Hide the graphics windows
    set_plot, 'NULL'

    ; Create the temporary directory for images
    tmpdir = repstr("tmp" + string(long(systime(/seconds))), " ", "")
    file_mkdir, tmpdir

    print, "Generating paths..."
    paths = []
    for i = 1, nparticles do begin
        ; Basic diffusion particle paths
        iterpath = get_path(diffusion, time_step, nsteps, ndim)

        ; Add bulk flow to the path
        flowdim = size(bulk_flow)
        if flowdim[0] ne 0 then begin
            iterpath = add_flow(bulk_flow, time_step, iterpath)
        endif

        ; Append the list of all paths.
        paths = [paths, iterpath]
    endfor

    ; Run the routine that generates the png frames
    print, "Creating animation frames..."
    create_frames, diffusion, paths, nparticles, nsteps, ndim, tmpdir

    ; Create a gif using imagemagick
    print, "Rendering..."
    cmd  = "convert -delay " + string(fix(time_step * 100)) + " -loop 0 "
    cmd += tmpdir + "/*.png " + outfile  
    spawn, cmd

    ; Clean up the temp files
    file_delete, tmpdir, /recursive

    ; Display the gif.
    if display eq 1 then begin
        print, "Displaying animation..."
        spawn, "animate " + outfile
    endif
end
