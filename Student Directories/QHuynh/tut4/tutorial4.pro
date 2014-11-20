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
     firstletter = strmid(clues(0),0,1)                    ;pulls first letter of first string in clues
     a = (strlowcase(firstletter))                      ;put that letter into lower case
     
     ;2. find the string containing the substring 'og' and extract it from that
     ;string
     ogstring = where(strmatch(clues, '*og*') EQ 1)        ;finds index of string where 'og'appears
     ogpos = where(strmatch(clues(ogstring), '*og*') EQ 1) ;finds index in that string where 'og' starts
     b = strmid(clues(ogstring), ogpos, 2)                 ;extract 'og' from that string
     
     ;3. add in an '_'
     c ='_'                                                ;puts third element of array as '_'
     
     ;4. find the string containing 'ate' and extract 3 letters from the p on
     atestring = where(strmatch(clues, '*ate*') EQ 1)      ;finds index of string where 'ate' appears
     ppos = strpos(clues(atestring), 'p')                  ;finds index where 'p' starts
     d = strmid(clues(atestring), ppos, 3)                 ;extracts 3 letters from p on
     
     ;5. find the string containing 'x' and extract the first two letters
     xstring = where(strmatch(clues, '*x*') EQ 1)           ;find index of string where 'x' appears
     e = strmid(clues(xstring(0)), 0, 2)                    ;extract first two letters of string
     
     ;make an array of the results
     result = [string(a),string(b),string(c),string(d),string(e)]

     ;6. use strjoin to collape your array into a single string
     newstring = strjoin(result)

     ;7. use repstr to replace the second o in your string with ''
     splitstring = strsplit(newstring, '_', /EXTRACT)       ;splits up string at _
     newarray = [splitstring]                               ;put the split string into an array so that the array has two elements
     newsecondpart = repstr(newarray(1), 'o', ' ')              ;remove 'o' in second element of array
     rmsecondo = strjoin(newsecondpart)
     modifiedarray = newarray(0) + rmsecondo  ;puts modified second element back with first
     finalstring = strjoin(modifiedarray, '_')              ;collapse modified array into a string

     ;   (try using the /reverse_search option in strpos)      
     ;8. add in a '.pro'
     finalresult = finalstring + '.pro'
     
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     print, finalresult   
   
     ;   and open it in emacs
     ;;output: log_prax.pro
end     
