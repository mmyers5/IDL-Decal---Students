;pro error1
;   x = findgen(10)
;   for i = 0, n_elements(x) do begin
;       print, x[i]
;   endfor
;end
;;this procedure calls on the index i, 0-10, in the float array x=[0,...,9]


;pro error2 ;;added missing letter o in pro
;   print, string(hello) ;;added coma after print, turned hello to string
;end
;;this procedure prints the string hello when run

;pro error3
;   print, 'three divided by two is ' + 3./2 ;;added period to indicate
;   float, changed numerical values to words
;end
;;this procedure prints string 'three divided by two is ' and the result of 3./2


;pro error3
;   x = ['1','2','3'] ;;turned elements of x into string for compatibility
;   y = ['a','b', 'c']
;   z = [x,y]
;   print, z ;;added command to print the result of the procedure
;end ;;added missing letter n in end
;;this procedure returns an array of two arrays, 1 2 3 and a b c 


;pro error4
;a = fltarr(1000,1000)
;s = size(a)
;   for i=0, s[1] - 1 do begin
;      for j=0, s[2] - 1 do begin 
;         if i+j LT 90 then begin
;            a[i,j] = sin(i+j)
;         endif
;      endfor
;   endfor
;   for i=0, s[1] - 1 do begin
;      for j=0, s[2] - 1 do begin
;         if a[i,j] NE 0 then begin
;            a[i,j] = 5
;         endif
;      endfor ;;added endfor to end the for j=0 loop
;   endfor
;end
;;indents added where necessary
;;the first part finds indices where the i-index plus the j-index is
;;less than 90 and replaces those indices with sin(i+j)
;;the second part replaces indices with non-zero values with 5
