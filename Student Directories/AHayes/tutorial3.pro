
pro error1

   ;;; print the numbers 0 through 9
   x = findgen(10)

   for i = 0, n_elements(x)-1 do begin
       print, x[i]
   endfor

end



pro error2
  
   ;;; print hello
   print, 'hello'

end



pro error3

   ;;; prints the message '3 divided by 2 is ' and then the value 3/2
   a = 3./2.
   print, '3 divided by 2 is ' + string(a)

end



pro error4

   ;;; makes two arrays, then makes a new array that contains the other two
   x = [1 , 2 , 3]
   y = ['a' , 'b' , 'c']

   stringx = string(x)

   z = [stringx , y]
   
   print, z

end



pro error5

  ;;; create an array of 0's and 5's where the 5's 'thin out' but
  ;;; maintain sinusoidal periodicity

  a = fltarr(1000,1000) ;create an array of zeros
  s = size(a)

  for i = 0, s[1] - 1 do begin ;run through first dimension of a

     for j = 0, s[2] - 1 do begin ;run through second dimension of a

        if i+j LT 90 then begin

           a[i,j] = sin(i+j)

        endif

     endfor

  endfor

  for i=0, s[1] - 1 do begin

     for j=0, s[2] - 1 do begin

        if a[i, j] NE 0 then begin

           a[i,j] = 5 ;overwrite all nonzero elements with 5's

        endif

     endfor

  end

end
