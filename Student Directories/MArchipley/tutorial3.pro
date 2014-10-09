pro error1                                     ;procedure makes a 1 x 10 array of numbers 0 to 9
   x = findgen(10)
   for i = 1, n_elements(x) do begin           ;changed i = 0 to i = 1
      print, float(i-1)                        ;changed print,x[i] to float(i-1) (procedure was working except for error about i)
   endfor
end


pro error2                                     ;procedure prints hello ;changed pr to pro
  print, 'hello'                               ;added comma after print ; put single quotes around hello
end

pro error3                                     ;procedure prints '3 divided by 2 is' then solves it
  print, '3 divided by 2 is', 3./2             ;removed space before ' ;added comma after is' ; removed + ;added . after 3 to make it a float (so the result doesn't round)
end


pro error4                                     ;procedure prints 1 2 3 a b c ;changed error3 to error4 so we don't have two error3s
   x = [string(1),string(2),string(3)]         ;made x values strings so z has one data type
   y = ['a','b','c']                           ;removed a space after b',
   z = [x, y]
   print, z                                    ;added a print statement so we actually get something
end                                            ;changed ed to end


pro error5                                     ;procedure does nothing? or prints giant array of zeros ;changed to error5 
  a = fltarr(1000,1000)
  s = size(a)
  for i = 0, s[1] - 1 do begin
     for j = 0, s[2] - 1 do begin 
        if i+j LT 90 then begin
           a[i,j] = sin(i+j)
           print, a                            ;added a print statement so something happens
        endif
     endfor
  endfor
  for i=0, s[1] - 1 do begin
     for j=0, s[2] - 1 do begin
        if a[i, j] NE 0 then begin
           a[i,j] = 5
        endif
     endfor
  endfor                                       ;added endfor statement
end                                            ;indented everything
