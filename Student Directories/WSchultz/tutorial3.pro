pro error1
   x = findgen(10)
   for i = 0, n_elements(x)-1 do begin ;bound not right
       print, x[i]
    endfor ; This runs through and prints the numbers 0-9
end


pro error2 ; prints hello
   print, 'hello'
end

pro error3 ; prints the words 3 /2 is and then prints it but it needed a period to make it a float
   print, '3 divided by 2 is ' + string(3/2.0)
end


pro error4 ; makes 2 arrays and then an array of arrays, 'dickbutt' - Austin  chill 
   x = [string(1),string(2),string(3)]
   y = ['a','b', 'c']
   z = [x, y]
end


pro error5 ; goes through a 1000 X 1000 array and makes them all different shit and then doesnt print it
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
