;indexing error
pro error1
    x = findgen(10)
    for i = 0, n_elements(x)-1 do begin
        print, x[i]
    endfor
end

;you were missing an "o"
pro error2
    print, 'hello'
end
;missing quotes
pro error3
    print, '3 divided by 2 is ' + string(3./2.) ;this will give an integer answer so we should change it to floats
end
;also added a string

;changed it to error 5 and added in string so it wouldn't error.
pro error5
    x = [1,2,3]
    y = ['a','b', 'c']
    z = [string(x), y]
    ;this won't do anyting so let's print z
    ;squadddd
    print, z
end
;missing an n in end
;just added some indenting and what not and had it print out a
pro error4
 	a = fltarr(1000,1000)
 	s = size(a)
 	for i = 0, s[1] - 1 do begin
 		for j = 0, s[2] - 1 do begin 
 			if i+j LT 90 then begin
 				a[i,j] = sin(i+j)
 			endif
 		endfor
 	endfor
 	for i=0, s[1] - 1 do begin
 		for j=0, s[2] - 1 do begin
 			if a[i, j] NE 0 then begin
 				a[i,j] = 5
 			endif
 		endfor
 	;needs second endfor
	endfor
	print, a
end
