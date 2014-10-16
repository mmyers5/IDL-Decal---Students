;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week

     x = strlowcase(strmid(clues[0], 0,1)) ; completes 1.

     for i=0, n_elements(clues)-1 do begin ; runs through all strings in clues
        if strpos(clues[i], 'og') NE -1 then begin ; finds the string with og
           barf = strmid(clues[i], strpos(clues[i], 'og'),2) ; sets barf to the string  og
        endif
        if strpos(clues[i], 'ate') NE -1 then begin ;this find the string with ate
           thee = strmid(clues[i], strpos(clues[i], 'p'), 3) ; this extracts p and 3 letters after
        endif
        if strpos(clues[i], 'x') NE -1 then begin ; this find the string with x
           cotnx = strmid(clues[i], 0, 2); extracts the first two letters of the string with x
        endif
     endfor
     
     arr = [x,barf,'_',thee,contx] ; makes an array of strings
     dem = strjoin(arr) ; joins the array together
     last = strsplit(dem, '_', /extract) ; splits it to make sure we do not extract the 1st o
     last[1] = repstr(last[1], strmid(last[1],strpos(last[1], 'o'),1), '') ;extracts the 2nd o
     final = strjoin(last, '_') ; joins the string together again
     prostat = strjoin([final, '.pro']) ; adds .pro to the end
     print, prostat ; prints the final string
     print, clues ; prints the array of strings from clues.txt
        

;Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge
;me for finding an amusing way to incorporate the word axes.


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
end     
