
function  makegrid, ndim

;;;initializes a grid with a random distribution of 
;;;alive and dead cells

grid = MAKE_ARRAY(ndim,ndim,/INTEGER, VALUE=0)
for x= 0, (ndim-1) do begin
for y= 0, (ndim-1) do begin
	condition =UINT( 8*RANDOMU(seed,1))
	if condition EQ 5 then begin
	grid[x,y] = 1
	endif
endfor
endfor
display, grid
RETURN, grid
end


function isalive, x,y,grid
;;; Checks whether a cell should remain alive or die (or come to life) based on rules of the game	
	if grid[x,y] EQ 1 then begin       ;;;determine how many adjecent cells to a given cell are alive
		ison = 1
	endif else begin
		ison=0
	endelse

	neighbors = 0
	if grid[x+1,y] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x-1,y] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x,y+1] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x,y-1] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x+1,y+1] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x+1,y-1] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x-1,y+1] EQ 1 then begin
		neighbors += 1
	endif
	if grid[x-1,y-1] EQ 1 then begin
		neighbors += 1
	endif


	
	if ison EQ 1 then begin              ;;; once number of neighbors has been calculated, apply rules to determine life status
		alive = 1
		if neighbors LT 2 then begin
			alive = 0
		endif
		if neighbors GT 3 then begin
			alive = 0
		endif
	endif
	if ison EQ 0 then begin
		alive = 0
		if (neighbors EQ 3)  then begin
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
;;; run is_alive on each cell, and update the grid
grid1 = MAKE_ARRAY(100,100,/INTEGER,value=0)
for x= 3,97 do begin
for y = 3,97 do begin
grid1[x,y] = isalive(x,y,grid)
endfor
endfor
return, grid1
end


pro main
grid = makegrid(100)
generations = 1000
count = 1
while count LT generations do begin
grid = update(grid)
display, grid
count += 1
WAIT, .01
endwhile
end
