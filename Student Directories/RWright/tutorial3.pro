pro error1
; prints floats 0 to 9
   x = findgen(10)
   for i = 0, n_elements(x) - 1 DO BEGIN
       print, x[i]
   endfor
end


pro error2
; prints hello
   print, 'hello'
end

pro error3
; prints 3 divided by 2
   print, '3 divided by 2 is ' + string(3./2)
end


pro error4
; makes some arrays
; note to self: figure out how to do this without weird spacing
   x = [1,2,3]
   y = ['a','b', 'c']
   z = [string(x[*]), y]
   print, z
end


pro error5
; First, fills the triangle (0, 0), (0, 89), (89, 0) with the sine of
; the x+y coordinates. Then sets all those values except at (0, 0) to 5.
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
  endfor
end
