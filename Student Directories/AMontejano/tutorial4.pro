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


     A=strlowcase(strmid(clues(0),0,1))   ;1, pulls out the 1st letter of the 1st string and makes it lowercase
       x=Where(strmatch(clues, '*og*'))   ;2, looks at the indences which include og
       y=Where(strmatch(clues(x), '*og*') eq 1)  ;looks at where the word that include og is located 
     B=strmid(clues(where(strmatch(clues, '*og*') eq 1)), y,2) ;extracts og from the string
     C='_'                                                     ;3, adds the underlinde
       u=where(strpos(clues,'ate') gt 1)                  ;gives where the string with ate is located
       v=strpos(clues(u), 'p')                 ;gives the number of character  where p is located from
     D=strmid(clues(u),v,3)              ;gives the 3 letter after p
       h=where(strmid(clues,'*x*') eq 1) ;5 finds which ind. has x in them
       i=h(0)                            ;picks one of the strings
     E=strmid(clues(h),i,2) ;extracts the first 2 letters of the string located on the i ind. and prints 2 letters
     F=strjoin(A+B+C+D+E)   ;6,combines the arrays into a single string
     R=repstr(F,'o','')     ;replaces o with blank. need to figure out how to replace 
     Q=R+".pro"             ;adds .pro to the string
     print,Q                ;prints out the string
     print,clues            ;you told me to do this

     
end     
