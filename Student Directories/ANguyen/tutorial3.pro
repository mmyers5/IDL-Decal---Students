pro error1
   x = findgen(10);makes x an array with 10 elments named (0.0 1.0 2.0 blah blah blah
   for i = 0, n_elements(x) do begin
      print, x[i];prints all the elements in array x
   endfor
end; basicaly prints all the numbers betweeen 0 and nine inclusively


pro error2
   print, 'hello'
end;prints the word hello

pro error3
   print, '3 divided by 2 is ';pritns out the string saying what error 3 does 
   print, 3./2.;prints the answer
end


pro error4
  a = 'a'
  b= 'b'
  c= 'c';makes the letters strings
   x = ['1', '2', '3'];also makes the numbers strings
   y = [a, b, c]
   z = [x, y]
print, z;prints z to see if it works
end


pro error5
a = fltarr(1000,1000); make a 1000 by 1000 array
s = size(a); makes s array [2, 1000, 1000, 4, 1000000], it has 2 dimensions, 1000 rows, 1000 columns, 4 means all the elements are floats, and it has 1000000 elements
for i = 0., s[1] - 1. do begin;for i is between 0 and 999
   for j = 0., s[2] - 1. do begin;for j is between 0 and 999 
      if i+j LT 90 then begin
         a[i,j] = sin(i+j);converts the elements of a in the first 90 columns and rows into the sin of the sim of i and j if i+j is less than 90
      endif
   endfor
endfor
print, a
for i=0., s[1] - 1. do begin
   for j=0, s[2] - 1 do begin
      if a[i, j] NE 0 then begin
         a[i,j] = 5;makes all the elements you changed into 5
      endif
   endfor
endfor
end
