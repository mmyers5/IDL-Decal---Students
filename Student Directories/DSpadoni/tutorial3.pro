;;this erro1 procedure uses a for loop to print the values of our x
;;array with 10 entries from 0.0 to 9.0
pro error1
   x = findgen(10)
   for i = 1, n_elements(x) do begin  ;;changed i to start counting from 1
       print, float(i-1)              ;;changed print,x[i] to the float cast of i-1
   endfor
end



;;this error2 procedure simply outputs hello
pro error2                            ;;changed pr to pro
   print, 'hello'                     ;;added , after print and ' around hello
end


;;this error3 procedure prints the result of some simple division
pro error3
  print, '3 divided by 2 is ', 3./2    ;;changed + to , and 3/2 to 3./2 so it outputs the correct value instead of rounding to 0
end                                    



;;this error4 procedure uses a final array to print the values of two others
pro error4                             ;;changed to error4 so we don't have two error3
   x = ['1','2','3']                   ;;casted the values in the x array to string so z doesn't have two different data types
   y = ['a','b','c']
   z = [x, y]
   print, z                            ;;added print, z so we can see the values of our first two arrays
end                                    ;;changed ed to end



;;this error5 procedure
pro error5                            ;;changed to error5
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
         if a[i,j] NE 0 then begin
           a[i,j] = 5
         endif
      endfor
   endfor
end
