pro plot3d,xx,yy,zz,intens,dax=dax,daz=daz,ax=ax,az=az, $
           ilog=ilog,do_circle=do_circle,_extra = e

if n_params() eq 4 then begin
   print,'Min:',min(intens,/nan),' Max:',max(intens,/nan)   
   if keyword_set(ilog) then $
    COLOR = BYTSCL(alog10(intens), TOP=!D.N_COLORS-1,/nan,$
                   min=min(alog10(intens),/nan)-1) else $
    COLOR = BYTSCL(intens, TOP=!D.N_COLORS-1,/nan,min=min(intens,/nan)*.5) 
endif else color = !D.N_COLORS-1
	
print,'Left: turn/x Middel: turn/z Right: exit'
if not keyword_set(dax) then dax = 1
if not keyword_set(daz) then daz = 1

zmn=min(zz,max=zmx)
xmn=min(xx,max=xmx)
ymn=min(yy,max=ymx)

z=[[zmn,zmx],[zmn,zmx]]
x=[[xmn,xmx],[xmn,xmx]]
y=[[ymn,ymn],[ymx,ymx]]

if not keyword_set(ax) then ax = 90.
if not keyword_set(az) then az = 360.

if keyword_set(do_circle) then begin
   circle =  fltarr(3,900)
   i_circle =  findgen(300)
   r_circle =  5.
   circle[0,0:299] =  r_circle*sin(i_circle/300.*2*!pi)
   circle[1,0:299] = r_circle*cos(i_circle/300.*2*!pi)
   r_circle =  10.
   circle[0,300:599] =  r_circle*sin(i_circle/300.*2*!pi)
   circle[1,300:599] = r_circle*cos(i_circle/300.*2*!pi)
   r_circle =  15.
   circle[0,600:899] =  r_circle*sin(i_circle/300.*2*!pi)
   circle[1,600:899] = r_circle*cos(i_circle/300.*2*!pi)
endif

surface,z,x,y,/nodata,/save,az=az,ax=ax,xtitle='X',ytitle='Y',ztitle='Z',_extra=e
plots,xx,yy,zz,/t3d,psym=6,color=color,_extra=e

!mouse.button = 1

while (!mouse.button ne 4) do begin
  cursor,x_tmp,y_tmp
  if !mouse.button eq 1 then ax = ax + dax $
	else if !mouse.button eq 2 then az = az + daz
  surface,z,x,y,/nodata,/save,az=az,ax=ax,xtitle='X',ytitle='Y',ztitle='Z',_extra=e
  plots,xx,yy,zz,/t3d,psym=6,color=color,_extra=e
;  plots,0.,8.5,0.,/t3d,psym=2,color=max(color),_extra=e,symsize=2
;  plots,0.,0.,0.,/t3d,psym=2,color=max(color)/2.,_extra=e,symsize=2
  if keyword_set(do_circle) then plots,circle[0,*],circle[1,*],circle[2,*],$
   /t3d,psym=3,color=max(color),_extra=e
  
endwhile

print,'ax=',ax,'  az=',az
end


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function isalive, x, y, z, grid
	;;; check neighbors for life/death and determine whether a cell should live in next generation
        if grid[x,y,z] EQ 1 then begin
                ison = 1
        endif else begin
                ison=0
        endelse

        neighbors = 0
        if grid[x+1,y,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y+1,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y-1,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y+1,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y-1,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y+1,z] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y-1,z] EQ 1 then begin
                neighbors += 1
        endif

        if grid[x+1,y,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y+1,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y-1,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y+1,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y-1,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y+1,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y-1,z+1] EQ 1 then begin
                neighbors += 1
        endif

        if grid[x+1,y,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y+1,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y-1,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y+1,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x+1,y-1,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y+1,z-1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x-1,y-1,z-1] EQ 1 then begin
                neighbors += 1
        endif

        if grid[x,y,z+1] EQ 1 then begin
                neighbors += 1
        endif
        if grid[x,y,z-1] EQ 1 then begin
                neighbors += 1
        endif

        if ison EQ 1 then begin        ;;; apply 3d GOL rules
                alive = 1
                if (neighbors LT 4) or (neighbors GT 11) then begin
                        alive = 0
                endif
        endif
        if ison EQ 0 then begin
                alive = 0
                if (neighbors GT 3) and (neighbors LT 12) then begin
		alive = 1
                endif
        endif

        if alive EQ 1 then begin
                return, 1
        endif else begin
                return, 0
        endelse
end

function update, grid
;;; make a blank grid and fill it with the results of checking is_alive on every cell of previous generation
grid1 = MAKE_ARRAY(100,100,100,/INTEGER,value=0)
for x = 3,97 do begin
for y = 3,97 do begin
for z = 3,97 do begin
grid1[x,y,z] = isalive(x,y,z,grid)
endfor
endfor
endfor
return, grid1
end





pro main
;;;initialize a grid with a random seed of alive cells
  x_on=UINT(100*randomu(seed,9000))
  y_on=UINT(100*randomu(seed,9000))
  z_on=UINT(100*randomu(seed,9000))
  plot3d, x_on,y_on,z_on, ax=165, az=381
  grid = make_array(100,100,100,/INTEGER,VALUE=0)
  grid[x_on,y_on,z_on] = 1 
;;;update the grid
  grid1 = update(grid)
  index = WHERE(grid1 EQ 1)
  s = SIZE(grid1)
  ncol = s[1]
  nrow = s[2]
  col = index mod ncol
  row = (index /ncol ) mod nrow
  frame = index / (nrow*ncol)
  plot3d, col, row, frame, ax=165, az=381
 ;;;update the grid
  grid2 = update(grid1)
  index1 = WHERE(grid2 EQ 1)
  s1 = SIZE(grid2)
  ncol1 = s1[1]
  nrow1 = s1[2]
  col1 = index1 mod ncol1
  row1 = (index1 /ncol1 ) mod nrow1
  frame1 = index1 / (nrow1*ncol1)
  plot3d, col1, row1, frame1, ax=165, az=381
;;; update it again
  grid_3 = update(grid2)
  index2 = WHERE(grid_3 EQ 1)
  s2 = SIZE(grid_3)
  ncol2 = s2[1]
  nrow2 = s2[2]
  col2 = index2 mod ncol2
  row2 = (index2 /ncol2 ) mod nrow2
  frame2 = index2 / (nrow2*ncol2)
  plot3d, col2, row2, frame2, ax=165,az=381
end
