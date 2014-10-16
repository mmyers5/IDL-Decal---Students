pro error1
   x = findgen(10)                    ;makes an array with 10
                                      ;elements. from 0.0 to 9.0 
   for i = 0, n_elements(x)-1 do begin  ;creates for loop
       print, x[i]                    ;prints out the first element of each i 
   endfor
end

;;pro error 1 prints out the the first element of i up until it reaches
;;the value of n_elements(x) which there are 10 elements in x=findgen(10)

pro error2                          ;;didn't spell pro correctly
   print, "hello"                   ;;forgot "," after print. and 
end                                 ;;quotes after the 'hello' 

;;Pro error 2 prints out the string "hello"  

pro error3
   print, '3 divided by 2 is'
   print, 3./2.        
end


;Pro error 3 takes the string, "3 divided by 2" and spits out the
;decimal value

pro error4                        ;;can't have mutliple procedures with same name
  
  x = ['1','2','3']               ;;need to make the elements into all strings, or integers in this case we use strings
  y = ['a','b','c']
  z = [x, y]
  print,z                         ;;needs print,z or the procedures doesn't know wat to do
end                               ;;needed to spell end correctly

;;pro error 4 prints an array with the elements 1 2 3 a b c but all as a string


pro error5
a = fltarr(1000,1000)              ;;this is a 1000 by 1000 array of all zeroes
s = size(a)
for i = 0, s[1] - 1 do begin       ;;for loop of i going up to 999 
   for j = 0, s[2] - 1 do begin    ;;for loop of j going up to 999
      if i+j LT 90 then begin      ;;if the sum is less than 90 it executes the code inside.
         a[i,j] = sin(i+j)         ;;looks at an entry and take the sin of the sum of indices as long as the sum of the indinces is less tha 90.         
         print, a[i,j]
      endif                       
   endfor
endfor
for i=0, s[1] - 1 do begin         ;;for loop of i going up to 999
   for j=0, s[2] - 1 do begin      ;;for loop of j going up to 999
      if a[i, j] NE 0 then begin   ;;if the value of a[i,j] is not 0 it executes the code inside
         a[i,j] = 5                ;;sets all nonzero entries as 5
         print, a[i,j]
      endif
   endfor
endfor                             ;needs another endfor
end

;;pro error5 modifies a 1000 by 1000 array and changes the values of the
;;top left corner into values of 5. (excluding the 1st entry)
