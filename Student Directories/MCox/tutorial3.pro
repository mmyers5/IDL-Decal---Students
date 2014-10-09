pro error1, x, i
   x = findgen(10)
   for i = 0, n_elements(x) do begin
       print, x[i]
   endfor
end

; This program is meant to count all numbers starting at 0 to one number
; before the imputed number

pro error2, x
  x = 'hello'
  print, x
end

; This program is meant to have the word 'hello' be read when putting
; the command 'print, hello'.

pro error3
   print, '3 divided by 2' + string(3./2)
end

;This program is meant to create simple math by haivng two strings
;create a simple exclamation as well as do the string function of 3/2.

pro error4, x, y, z
   x = ['1', '2', '3']
   y = ['a','b','c']
   z = [x, y]
   print, z
end

;This program is meant to set one variable equal to an array of numbers
;and another to an array of strings, and the last variable splits both
;arrays because you can't have both together at once.

pro error5
  a = fltarr(1000,1000)
  s = size(a)
    for i = 0, s[1] - 1 do begin
    for j = 0, s[2] - 1 do begin 
       if i+j lt 90 then begin
          a[i, j] = sin(i+j)
       endif
    endfor
    endfor
  for i = 0, s[1] - 1 do begin
  for j = 0, s[2] - 1 do begin
     if a[i, j] ne 0 then begin
        a[i, j] = 5
     endif
  endfor
endfor
  print, a
end

;This program is meant to list out an array of 0's by the
;thousand and by five integers to the right of the decimal, and the
;array starts if the condition of i and j are both less than 90 and are
;individually not equal to zero.
