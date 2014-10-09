pro error1

; prints the numbers from 0 to 9

 x = findgen(10)

for i = 0, n_elements(x)-1 do begin
   print, x[i]
endfor

end


pro error2

   ; prints the word 'hello'
   print, 'hello'

end

pro error3
   ; prints the message '3 divided by 2 is ' and then in the fraction form
   ; '3/2'
   a = 3./2.
   print, '3 divided by 2 is' + string(a)

end


pro error4

   ; makes two arrays, and then makes another array that has the other two arrays
   x = [1, 2, 3]
   y = ['a' , 'b' , 'c']

   stringx = string(x)

   z = [stringx , y]

   print, z

end


pro error5

   ; creates an array of 0's and 5's, where all nonzero elements are overwritten
   ; as 5's

   a = fltarr(1000,1000); creates an array of zeros
   s = size(a)

   for i = 0, s[1] - 1 do begin; runs until first dimension of a

      for j = 0, s[2] - 1 do begin; runs until second dimension of a

         if i+j LT 90 then begin

            a[i,j] = sin(i+j)

         endif

      endfor

   endfor

   for i=0, s[1] - 1 do begin

      for j=0, s[2] - 1 do begin

         if a[i, j] NE 0 then begin

            a[i,j] = 5; this overwrites all nonzero elements with 5's

         endif

      endfor

   end

end
