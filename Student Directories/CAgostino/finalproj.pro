function drawboard
	x = findgen(100)
	y = make_array(1,100,/integer,value=100)
	plot, x,y
;	for i=1, 10 DO BEGIN 
;		oplot, x, y-10*i
;;	endfor
;	x = make_array(1,100,/integer,value=100)
;	y= findgen(100)
;	for i = 1,10 DO BEGIN ;for loop for the vertical lines
;		oplot, x-10*i,y
;	endfor



end

function makefrog,x,y ;this is some sort of shitty looking frog i will look to change it to be dickbutt
	frogx = [1,0,1,.5,2,3.5,3,4,3,1]+x
	frogy = [0,1,2,2.5,3.5,2.5,2,1,0,0]+y
	if (x GT 95) then begin
		x= 95
	endif
	if (y GT 95) then begin
		y =  95
	endif
	if (x LT 0) then begin
		x =0
	endif
	if (y LT 0) then begin
		y= 0
	endif
	dickbuttx= [1.95,1.85,1.8,1.78,1.76,1.8,1.85,1.91,1.98,2.25,2.15,2.1,2,1.95,1.92,1.9,1.92,1.97,2.04,2.12,2.2,2.28,2.26,2.3,2.35,2.4,2.7,2.8,2.9,3,3.1,3.2,3.3,3.4,3.45,3.47,3.49,3.5,3.51,3.5,3.48,3.46,3.38,3.25,3.25,3.2,3.18,3.5,3.68,3.78,3.82,4,4.18,4.3,4.4,4.45,4.42,4.3,4.18,4.11,4.12,4.2,4.28,4.25,4.31,4.3,4.2,4.,3.98,3.55,3.7,3.5,3.4,3.3,3.15,2.85,2.7,2.65,2.62,2.65,2.72,2.8,2.82,2.83,2.93,2.34,1.95]
	dickbutty= [1.35,1.4,1.5,1.6,1.68,1.7,1.68,1.63,1.53,1.82,1.9,1.98,2.15,2.29,2.5,2.8,3,3.25,3.45,3.7,3.8,3.92,4,4.1,4.15,4.16,4.3,4.35,4.38,4.4,4.42,4.38,4.35,4.28,4.2,4.1,4.05,4,3.95,3.8,3.75,3.6,3.3,3.25,3,2.9,2.8,2.62,2.62,2.6,2.55,2.48,2.62,2.9,2.98,2.95,2.8,2.7,2.42,2.3,2.28,2.28,2.15,2.05,1.9,1.85,1.82,1.83,1.9,1.7,1.6,1.51,1.49,1.5,1.55,1.02,1.18,1.3,1.4,1.42,1.41,1.35,1.32,1.55,1.76,1.75,1.35]
	dickbuttx = 2*(dickbuttx-1.95) +x
	dickbutty = 2*(dickbutty-1.35) + y
	oplot, dickbuttx,dickbutty, thick = 2, color = color24(0,255,0)
	return, [x,y]
	
end
function makefuckingship,x,y ;dam
	if (x LT 0) then begin 
		x = 98
	endif
	shipy=4*[0,1,1,.5,0,0]+y
	shipx=4*[0,0,1,2,1,0]+x
	oplot, shipx, shipy, thick = 2, color = color24(255,0,255)
	return, [x,y]
end



function maketriangle,x,y ;3 sides op
	if (x GT 100) then begin
		x= 2
	endif
	trianglex = 3*[0,.5,1,0 ] + x
	triangley = 3*[0,1,0,0] +y
	oplot, trianglex,triangley, thick = 2, color =color24(255,255,0)
	return, [x,y]
end

function makediamond,x,y ;circles are fam
	if (x GT 100) then begin
		x=2
	endif
	diamondx = 4*[.5,0,.5,1,.5]+x
	diamondy = 4*[0,.5,1,.5,0]+y
	oplot, diamondx, diamondy,thick =2, color = color24(0,255,255)
	return, [x,y]	
end

function makefuckingsquares,x,y ;fck squares
	if (x LT 0) then begin
		x=98
	endif
	squarey = 3*[0,1,1,0,0]+y
	squarex= 3*[0,0,1,1,0]+x
	
	oplot, squarex, squarey, thick = 2, color = color24(23,34,212)
	return, [x,y]
end
function checkdeath, frog,everythingelse
	frog_alive = 1
	for i=0, n_elements(everythingelse)/2.-1 DO BEGIN
		if (abs(frog[0]-everythingelse[0,i]) LT 5) and (abs(frog[1] -everythingelse[1,i]) LT 5) then begin	
			frog_alive = 0
		endif
	endfor
	return, frog_alive
end

pro main
	frog_alive = 1
	board = drawboard() 
	keypress= byte(get_kbrd(0,/escape))
                ;if (keypress[0] EQ 0) then begin
                ;       wait, .025      

                ;if (keypress[0] eq "") then continue
                ;endif
	 ;making the goddamn grid
	frog = makefrog(10,0) ;making the damn frog
	;keypress events op
	triangle1 = maketriangle(0,22.5)
	triangle2 = maketriangle(30,22.5)
	triangle3 = maketriangle(60,22.5)	
	triangle4 = maketriangle(90,22.5)
	square1 = makefuckingsquares(18,42.5)
	square2	= makefuckingsquares(38,42.5)
	square3 =makefuckingsquares(58,42.5)
	square4=makefuckingsquares(78,42.5)
	square5=makefuckingsquares(98,42.5)
	diamond1 = makediamond(2,62.5)
	diamond2= makediamond(22,62.5)
	diamond3= makediamond(44,62.5)
	diamond4= makediamond(62,62.5)
	diamond5= makediamond(82,62.5)
	ship1 = makefuckingship(88,82.5)
	ship2 = makefuckingship(68,82.5)
	ship3 = makefuckingship(48,82.5)
	ship4 = makefuckingship(28,82.5)
	ship5 = makefuckingship(8,82.5)
	while (frog_alive EQ 1) DO BEGIN
		wait, .025
		x=drawboard()
		print, frog
		frog = makefrog(frog[0],frog[1])
		triangle1 = maketriangle(triangle1[0]+1, triangle1[1])
		triangle2 = maketriangle(triangle2[0]+1, triangle2[1])
		triangle3 = maketriangle(triangle3[0]+1, triangle3[1])
		triangle4 = maketriangle(triangle4[0]+1, triangle4[1])
		square1 = makefuckingsquares(square1[0]  -1,square1[1])
		square2 = makefuckingsquares(square2[0]  -1,square2[1])
		square3 = makefuckingsquares(square3[0]  -1,square3[1])
		square4 = makefuckingsquares(square4[0]  -1,square4[1])
		square5 = makefuckingsquares(square5[0]  -1,square5[1])	
		diamond1 = makediamond(diamond1[0] +1, diamond1[1])
		diamond2 = makediamond(diamond2[0] +1, diamond2[1])
		diamond3 = makediamond(diamond3[0] +1, diamond3[1])
		diamond4 = makediamond(diamond4[0] +1, diamond4[1])
		diamond5 = makediamond(diamond5[0] +1, diamond5[1])
		ship1 = makefuckingship(ship1[0] -1, ship1[1])
		ship2 = makefuckingship(ship2[0] -1, ship2[1])	
		ship3 = makefuckingship(ship3[0] -1, ship3[1])	
		ship4 = makefuckingship(ship4[0] -1, ship4[1])	
		ship5 = makefuckingship(ship5[0] -1, ship5[1])	
		all = [[triangle1],[triangle2],[triangle3],[triangle4],[square1],[square2],[square3],[square4],[square5],[diamond1],[diamond2],[diamond3],[diamond4],[diamond5],[ship1],[ship2],[ship3],[ship4],[ship5]]
		frog_alive = checkdeath(frog,all)
	;	print,frog_alive
		keypress = byte(get_kbrd(0,/escape))
		;if (keypress[0] EQ 0) then begin
		;	wait, .025	
			
		if (keypress[0] eq "") then continue
		;endif
		if (keypress[2] EQ 68) then begin
			x = drawboard()
			frog = makefrog(frog[0]-2.5,frog[1])
			triangle1 = maketriangle(triangle1[0], triangle1[1])
			triangle2 = maketriangle(triangle2[0], triangle2[1])
			triangle3 = maketriangle(triangle3[0], triangle3[1])
			triangle4 = maketriangle(triangle4[0], triangle4[1])
			square1 = makefuckingsquares(square1[0],square1[1])
			square2 = makefuckingsquares(square2[0],square2[1])
			square3 = makefuckingsquares(square3[0],square3[1])
			square4 = makefuckingsquares(square4[0],square4[1])
			square5 = makefuckingsquares(square5[0],square5[1])		
			diamond1 = makediamond(diamond1[0], diamond1[1])
			diamond2 = makediamond(diamond2[0], diamond2[1])
			diamond3 = makediamond(diamond3[0], diamond3[1])
			diamond4 = makediamond(diamond4[0], diamond4[1])
			diamond5 = makediamond(diamond5[0], diamond5[1])
			ship1 = makefuckingship(ship1[0], ship1[1])
			ship2 = makefuckingship(ship2[0], ship2[1])	
			ship3 = makefuckingship(ship3[0], ship3[1])	
			ship4 = makefuckingship(ship4[0], ship4[1])	
			ship5 = makefuckingship(ship5[0], ship5[1])	
		endif
		if (keypress[2] EQ 67) then begin
			x = drawboard()
			frog=makefrog(frog[0]+2.5,frog[1])


			triangle1 = maketriangle(triangle1[0], triangle1[1])
			triangle2 = maketriangle(triangle2[0], triangle2[1])
			triangle3 = maketriangle(triangle3[0], triangle3[1])
			triangle4 = maketriangle(triangle4[0], triangle4[1])
			square1 = makefuckingsquares(square1[0],square1[1])
			square2 = makefuckingsquares(square2[0],square2[1])
			square3 = makefuckingsquares(square3[0],square3[1])
			square4 = makefuckingsquares(square4[0],square4[1])
			square5 = makefuckingsquares(square5[0],square5[1])	
			diamond1 = makediamond(diamond1[0] , diamond1[1])
			diamond2 = makediamond(diamond2[0], diamond2[1])
			diamond3 = makediamond(diamond3[0], diamond3[1])
			diamond4 = makediamond(diamond4[0] , diamond4[1])
			diamond5 = makediamond(diamond5[0] , diamond5[1])
			ship1 = makefuckingship(ship1[0] , ship1[1])
			ship2 = makefuckingship(ship2[0] , ship2[1])	
			ship3 = makefuckingship(ship3[0] , ship3[1])	
			ship4 = makefuckingship(ship4[0] , ship4[1])	
			ship5 = makefuckingship(ship5[0] , ship5[1])
		endif
		;if down arrow
	;			replot wikeypress = byte(get_kbrd(10,/escape))th frog moved 
		;endif
		;if left arrow
	;		replot with frog moved
		if (keypress[2] EQ 66) then begin
			x= drawboard()
			frog= makefrog(frog[0],frog[1]-2.5)
			triangle1 = maketriangle(triangle1[0], triangle1[1])
			triangle2 = maketriangle(triangle2[0], triangle2[1])
			triangle3 = maketriangle(triangle3[0], triangle3[1])
			triangle4 = maketriangle(triangle4[0], triangle4[1])
			square1 = makefuckingsquares(square1[0] ,square1[1])
			square2 = makefuckingsquares(square2[0] ,square2[1])
			square3 = makefuckingsquares(square3[0] ,square3[1])
			square4 = makefuckingsquares(square4[0] ,square4[1])
			square5 = makefuckingsquares(square5[0] ,square5[1])	
			diamond1 = makediamond(diamond1[0] , diamond1[1])
			diamond2 = makediamond(diamond2[0], diamond2[1])
			diamond3 = makediamond(diamond3[0], diamond3[1])
			diamond4 = makediamond(diamond4[0], diamond4[1])

			diamond5 = makediamond(diamond5[0], diamond5[1])
			ship1 = makefuckingship(ship1[0], ship1[1])
			ship2 = makefuckingship(ship2[0], ship2[1])	
			ship3 = makefuckingship(ship3[0], ship3[1])	
			ship4 = makefuckingship(ship4[0], ship4[1])	
			ship5 = makefuckingship(ship5[0], ship5[1])
		endif
		if (keypress[2] EQ 65) then begin

			x=drawboard()
			frog=makefrog(frog[0],frog[1]+2.5)
			triangle1 = maketriangle(triangle1[0], triangle1[1])
			triangle2 = maketriangle(triangle2[0], triangle2[1])
			triangle3 = maketriangle(triangle3[0], triangle3[1])
			triangle4 = maketriangle(triangle4[0], triangle4[1])
			square1 = makefuckingsquares(square1[0] ,square1[1])
			square2 = makefuckingsquares(square2[0] ,square2[1])
			square3 = makefuckingsquares(square3[0] ,square3[1])
			square4 = makefuckingsquares(square4[0] ,square4[1])
			square5 = makefuckingsquares(square5[0] ,square5[1])	
			diamond1 = makediamond(diamond1[0], diamond1[1])
			diamond2 = makediamond(diamond2[0], diamond2[1])
			diamond3 = makediamond(diamond3[0], diamond3[1])
			diamond4 = makediamond(diamond4[0], diamond4[1])
			diamond5 = makediamond(diamond5[0], diamond5[1])
			ship1 = makefuckingship(ship1[0], ship1[1])
			ship2 = makefuckingship(ship2[0], ship2[1])	
			ship3 = makefuckingship(ship3[0], ship3[1])	
			ship4 = makefuckingship(ship4[0], ship4[1])	
			ship5 = makefuckingship(ship5[0], ship5[1])	

		endif
			 
		if (frog[1] GT 90) then begin
			frog_alive =0
			print, 'helya u win homie'
		endif

			
		
	endwhile
	
	
end

        
