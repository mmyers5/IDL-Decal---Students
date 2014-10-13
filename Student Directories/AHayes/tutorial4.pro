;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week
     
     ;please avoid simply printing clues to
     ;get an idea of what the strings 
     ;look like. The idea is to work with the
     ;functions within idl.

     ;FOLLOW THE FOLLOWING INSTRUCTIONS AND CONCATENATE THE RESULTS OF EACH INTO AN ARRAY
     
     ;1. extract the first letter of the first string in clues and make it
     ;   lowercase (use strlowcase)
     ;2. find the string containing the substring 'og' and extract it from that string
     ;3. add in an '_'
     ;4. find the string containing 'ate' and extract 3 letters from the p on
     ;5. find the string containing 'x' and extract the first two letters
     ;6. use strjoin to collape your array into a single string
     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)      
     ;8. add in a '.pro'
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs




     ;;; Sorry for the terrible variable naming, but I have to go
     ;;; study for a midterm so I'm not changing them
     A = strlowcase(strmid(clues(0),0,1)) ; get first lowercase letter
     
     ; Search for 'og' and get word and letter index
     for i = 0, 22 do begin
        if strpos(clues(i),'og') GE 0 then begin
           X = i
           Y = strpos(clues(i),'og')
        endif
     endfor

     B = strmid(clues(X),Y,2) ; cut out desired letters
     C = '_'

     ; Search for 'ate' and get word index
     for i = 0, 22 do begin
        if strpos(clues(i),'ate') GE 0 then begin
           D = i
        endif
     endfor 

    
     E = strpos(clues(D),'p') ; get letter index
     F = strmid(clues(D),E,3) ; cut out desired letters
     

     ; Search for 'x' and get word index
     for i = 0, 22 do begin
        if strpos(clues(i),'x') GE 0 then begin
           G = i
        endif
     endfor 

     H = strmid(clues(G),0,2) ; cut out desired letters
     I = A+B+C ; create first half of final string
     J = F+H ; create second half
     K = repstr(J,'o','') ; remove second o
     
     Final = I + K + '.pro' ; put it together and bippidy bop
     print, Final
end     


;;; Lumberjack fantasies have me oggling axes with less prudent
;;; intentions. Don't judge me for finding an amusing way to 
;;; incorporate the word axes.
