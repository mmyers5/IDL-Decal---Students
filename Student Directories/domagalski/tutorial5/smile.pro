function plot_circle, radius, centerx, centery, color, full
    ; This function creates a circle on top of the current plot.
    ; INPUT:
    ;   radius:     Radius of the circle
    ;   centerx:    X coordinate of the center
    ;   centery:    Y coordinate of the center
    ;   color:      Single-char color code for the circle's color
    ;   full:       Whether to create a full circle or half circle
    ; OUTPUT
    ;   This function returns the plot object generated from the parameters.
    if full eq 1 then begin
        angles = 2 * !pi * findgen(1000) / 1000.
    endif else begin
        angles = !pi * (1.0 + findgen(1000) / 1000.)
    endelse

    ; Generate the x/y values from a parameteric equation and plot dat shit...
    xvals = centerx + radius * cos(angles)
    yvals = centery + radius * sin(angles)
    return, plot(xvals, yvals, color, /overplot)
end

pro mksmile
    ; This is the main procedure that runs all of the stuff.
    body = plot_circle(5, 5, 5, 'k', 1)
    eye1 = plot_circle(0.5, 3, 6, 'b', 1)
    eye2 = plot_circle(0.5, 7, 6, 'b', 1)
    smile = plot_circle(4, 5, 5, 'r', 0)

    ; Format the ticks and title
    body.xtitle = 'Left-Right'
    body.ytitle= 'Top-Bottom'
    body.title = 'TGIAF'
    body.xticklen = 0.0
    body.yticklen = 0.0
    body.xsubticklen = 0.0
    body.ysubticklen = 0.0
end
