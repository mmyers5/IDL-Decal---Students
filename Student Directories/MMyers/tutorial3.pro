pro error1

; Procedure prints floats 1-9

  x = findgen(10)
  FOR i = 0, n_elements(x)-1 DO BEGIN
     print, x[i]
  ENDFOR
end


pro error2

; Procedure prints a generic greeting
; Whoever wrote this shit didn't spell "pro" properly. 

  hello = "'sup wid it"
  print, hello
end

pro error3

; Have you ever wondered what 3 divided by 2 is?
; Don't reach for your calculator; this procedure's got it

  print, '3 divided by 2 is ' + string(3./2)
end


pro error4

; This procedure tried to make a list of numbers and letters
; and failed.

   x = [1,2,3]
   y = ['a','b', 'c']
   z = list(x, y)
   print, z
end


pro error5, a

; Going to guess this procedure is supposed to make a meshgrid such
; that each coordinate cooresponding to the array index is the sine of
; the two coordinates, i.e. z(x,y) = sin(x+y), where the boundaries
; are 5. Is it a tsunami simulation??
 
  a = fltarr(1000,1000)                             
  s = size(a)                                   ; useful for indexing array 
  
  FOR i = 0, s[1] - 1 DO BEGIN                  ; for every number 1-999
     FOR j = 0, s[2] - 1 DO BEGIN               ; for every number 1-999
        IF (i+j) LT (!pi/2) THEN BEGIN
           a[i,j] = sin((i+j))                  ; take sine of stuff
        ENDIF
     ENDFOR
  ENDFOR

; loop handles zeros rather than replacing all the numbers generated above
  FOR i=0, s[1] - 1 DO BEGIN
     FOR j=0, s[2] - 1 DO BEGIN
        IF a[i, j] EQ 0 THEN BEGIN
           a[i,j] = 5                           ; replace 0 with 5 in array
        ENDIF
     ENDFOR
  ENDFOR

end
