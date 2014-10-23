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
     a=strlowcase(strmid(clues(0), 0, 1))                         ;takes the 0th line of clues, take the 0th letter, only go up to that letter, and lowercase it.
     ogrow=WHERE(STRMATCH(clues, '*og*') EQ 1)                    ;find the row where og is
     ogcolumn=WHERE(STRMATCH(clues(ogrow), '*og*') EQ 1)          ;find the column where og is
     b=strmid(clues(WHERE(STRMATCH(clues, '*og*') EQ 1)), ogcolumn, 2) ;give me og
     c="_"                                                             ;make c _
     aterow=WHERE(STRMATCH(clues, '*ate*') EQ 1)                       ;find the row where ate is
     pcolumn=strpos(clues(aterow), "p")                                ; find the column where p is
     d=strmid(clues(aterow), pcolumn, 3)                               ;make d the 3 letters after p
     xrow=WHERE(STRMATCH(clues, '*x*') EQ 1)                           ; find the row where x is
     truexrow=xrow(1)                                                  ;there is a typo and this string appears twice, i'm just choosing the second one
     e=strmid(clues(truexrow), 0, 2)                                   ;make e the first two letters after x
     lithosphere=[a, b, c, d, e]                                       ;make an array of what we have so far
     gravity=strjoin(lithosphere)                                      ; string join everything                             
     donut=where(STRMATCH(lithosphere, '*o*') EQ 1)                    ;find where the o's are in the unjoined array
     newd=repstr(lithosphere(donut(1)), "o", " ")                      ;remake the element with teh second o without the o
     newlithosphere=[a, b, c, newd, e]                                 ;now make the new unjoined array without the second o
     newgravity=strjoin(newlithosphere)                                ;now join it
     file=newgravity+'.pro'                                            ;add hte file to it
     print, file                                                       ;print it
;clues is Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge me for finding an amusing way to incorporate the word axes.
end     
