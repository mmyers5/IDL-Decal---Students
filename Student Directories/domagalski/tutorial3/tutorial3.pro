; The error was than an index went out of range.
pro error1
   x = findgen(10)
   for i = 0, n_elements(x)-1 do begin
       print, x[i]
   endfor
end

; The error is that pro was misspelled and there was no comma after print. Also,
; hello needed to be changed to a string before printing it.
pro error2
   print, "hello"
end

; Don't use integer arithmatic when a decimal answer is desired.
; Also there should have been a comma instead of a plus sign.
pro error3
   print, '3 divided by 2 is ', 3.0/2
end

; There is already a procedure named error3, renaming to error4 and renaming the
; error4 procedure below to error5
; Lists in IDL must be homogenous, so I'm changing everything in x to a string.
; I'm also printing z so it actually looks like this procedure does something.
pro error4
   x = ['1','2','3']
   y = ['a','b', 'c']
   z = [x, y]
   print, z
end

; This needs to be properly indented.
; There is also a missing endfor in the last loop.
; I'm printing a so it looks like this procedure did something.
pro error5
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
