
pro error1
   x = findgen(10)
   for i = 0, n_elements(x)-1 DO BEGIN ;index went to wrong end limit
       print, x[i]
   endfor
end


pro error2 ;missing o in pro
   print, 'hello' ;syntax, need comma after print and quotes around string
end


pro error3
   print, '3 divided by 2 is ' + string(3./2.) ;make into a float so that the answer is anon integer, converted to string
end


pro error5 ;had the same name as previous procedure, changed 3 to 5
   x = [1,2,3]
   y = ['a','b', 'c']
   z = [string(x), y] ;need to add two arrays of the same type, so we convert x to a string
   print, z ;so that we get an output from the procedure
end ;missing n in end


;lots of indentation
pro error4
  a = fltarr(1000,1000)
  s = size(a)
  for i = 0, s[1] - 1 DO BEGIN
     for j = 0, s[2] - 1 DO BEGIN 
        if i+j LT 90 THEN BEGIN
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
  endfor ;was missing the second endfor
  print, a ;so that we get an output
end
