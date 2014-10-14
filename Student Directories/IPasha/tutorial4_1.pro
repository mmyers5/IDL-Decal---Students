;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!
function retrieve, in, string1
	return, in[WHERE(STRMATCH(in, "*", + string1 + '*'))]
end 


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


     title = strarr(10)
     title[0] = strlowcase(strmid(clues[0], 0, 1))

     
     ;2. find the string containing the substring 'og' and extract it

	 
	 og = retrieve(clues, 'og')
	 position = strpos(og, 'og')
	 title += strmid(og, position, 2)
	
	;3. add in an '_' 
	
	title += '_'
	 
	;4. find the string containing 'ate' and extract 3 letters from the p on
	
	ate = retrieve(clues, 'ate')
	position = strpos(ate, 'p')
	title += strmid(ate, position, 3)
	
     ;5. find the string containing 'x' and extract the first two letters
	 x = retrieve(clues, 'x')
	 title += strmid(x, 0, 2)
	 
	 
     ;6. use strjoin to collape your array into a single string
     
	 title = strjoin(title)
	 
	 ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)      
     
	 position = strpos(title, 'o', /reverse_search)
	 beg = strmid(title, 0, position)
	 en_d = strmid(title, position)
	 
	 title = beg + repsrtr(en_d, 'o')
	 
	 
	 
	 ;8. add in a '.pro'
     
	 title += '.pro'
	 
	 ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs
	 print, title
	 ; it was log_prax.pro
	 print, clues
	 ; Lumberjack fantasies have me oggling axes with less prudent intentions.
     ; Don't judge me for finding an amusing way
     ; to incorporate the word axes.
end     
