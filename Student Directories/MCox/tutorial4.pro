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




     final = strlowcase(strmid(clues(0),0,1))
;This takes the first letter of the first string and makes it into a lowercase letter.
     final2 = strpos(clues, 'og',(0))
;This lets me know that 'og' is in the 4th position in the string.
     final3 = strmid(clues(4), 0, 2)
;This takes the 4th position in the string array and extracts only 'og'.
     final4 = '_'
;This assigned '_' to the variable 'final4'.
     final5 = strpos(clues, 'ate',(0))
;This lets me know that 'ate' is in the 19th position in the string.
     final6 = strmid(clues(19), 5, 3)
;This takes the 19th position in the string array and extracts only 'por'.
     final7 = strpos(clues, 'x',(0))
;This lets me know that there are two substrings with 'x' in the 5th and
;22nd positions
     final8 = strmid(clues(5), 0, 2)
;This takes both the 5th positions and extracts only 'ax'.
     final9 = final + final3 + final4 + final6 + final8
;This colapses the entire array into a single string which contains the extracted letters/variables.
     final10 = repstr(final9, 'o', '')
;This replaces 'o' in the string with nothing, and ends up filling in
;the gap.
     final11 = '.pro'
;This assigned '.pro' to the variable 'final11'.
     final12 = final10 + final11
;This combines the variables into a name of a file in the format of a string.
     print, final12
;This prints the string into IDL, and I sucessfully opened the string
;file in emacs within the directory in Step 9 above.
end     
