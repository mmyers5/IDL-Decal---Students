;;prints the array form 0-9 in floats
pro error1
   x = findgen(10)
   for i = 0, n_elements(x)-1 DO BEGIN
       print, x[i]
    ENDFOR
end



;; error2 prints out hello!
pro error2
   print, 'hello'
end

;; prints out 3/2 (1.5)
pro error3
   print, '3 divided by 2 is' + string(3./2)
end

;;; prints an array with 1,2,3 and a,b,c with no errors
pro error4
    x = [string(1),string(2),string(3)]
    y = ['a','b', 'c']
    z = [x,y]
    print, z
end

;;; prints out a 1000x1000 float array with all 0s 
pro error5
  a = fltarr(1000,1000)
  s = size(a)
  for i = 0, s[1] - 1 DO BEGIN
     for j = 0, s[2] - 1 DO BEGIN
        if i+j LT 90 THEN BEGIN
           a[i,j] = sin(i+j)
        ENDIF
       ENDFOR
  ENDFOR
  for i=0, s[1] - 1 DO BEGIN
     for j=0, s[2] - 1 DO BEGIN
        if a[i, j] NE 0 THEN BEGIN
           a[i,j] = 5
        ENDIF
     ENDFOR
  ENDFOR
print, a
end
