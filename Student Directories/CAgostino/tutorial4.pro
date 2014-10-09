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
     youknow = strlowcase(strmid(clues[0],0,1))
     ;2. find the string containing the substring 'og' and extract it from that string
     find_that_og_kush = where(strmatch(clues, "*"+'og'+"*"));this shit finds that og
     find_that_og_kush = clues[find_that_og_kush]; this indexes clues to get the correct string
     
     position = strpos(find_that_og_kush,'og'); swag
     ;print, youknow
     youknow+= strmid(find_that_og_kush,position,2);youknow
     ;print, youknow
     ;3. add in an '_'
     youknow += '_'
     ;4. find the string containing 'ate' and extract 3 letters from the p on
     hashtag_find_ate= where(strmatch(clues,"*" + 'ate'+"*"))
     hashtag_find_ate = clues[hashtag_find_ate]
     position=strpos(hashtag_find_ate, 'p')
     youknow += strmid(hashtag_find_ate,position, 3)
     ;5. find the string containing 'x' and extract the first two letters
     find_young_x=where(strmatch(clues,"*"+ 'x'+"*"))
     find_young_x=clues[find_young_x]
     youknow += strmid(find_young_x,0,2)

     ;6. use strjoin to collape your array into a single string
     youknow = strjoin(youknow)
     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strposition)      
   ;  print, youknow
     position = strpos(youknow,'o',/reverse_search)
     beginning = strmid(youknow, 0,position)
     ending = strmid(youknow,position)
     youknow = beginning +repstr(ending,'o')
     ;8. add in a '.pro'
     youknow += '.pro'
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs
     print, youknow
    ;prints log_prax.pro 
     print, clues


	; wenn es Clues ausdruckt, sagt es "Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge me for finding an amusing way to incorporate the word axes."

end     
