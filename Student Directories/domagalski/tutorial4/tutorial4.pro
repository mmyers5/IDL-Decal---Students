;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

function get_str, expr, substr
    return, expr[where(strmatch(expr, "*" + substr + "*"))]
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
     derp = strlowcase(strmid(clues[0], 0, 1))
     ;2. find the string containing the substring 'og' and extract it from that string
     find_og = get_str(clues, 'og')
     pos = strpos(find_og, 'og') 
     derp += strmid(find_og, pos, 2)
     ;3. add in an '_'
     derp += '_'
     ;4. find the string containing 'ate' and extract 3 letters from the p on
     find_ate = get_str(clues, 'ate')
     pos = strpos(find_ate, 'p')
     derp += strmid(find_ate, pos, 3)
     ;5. find the string containing 'x' and extract the first two letters
     find_x = get_str(clues, 'x')
     derp += strmid(find_x, 0, 2)
     ;6. use strjoin to collape your array into a single string
     derp = strjoin(derp) ; it was already in a single string though...
     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)      
     pos = strpos(derp, 'o', /reverse_search)
     prefix = strmid(derp, 0, pos)
     suffix = strmid(derp, pos)
     derp = prefix + repstr(suffix, 'o')
     ;8. add in a '.pro'
     derp += '.pro'
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs
     print, derp
     ; log_prax.pro instructions:
     print, clues ; I'm wrapping my output at 80 characters here.
     ; Lumberjack fantasies have me oggling axes with less prudent intentions.
     ; Don't judge me for finding an amusing way
     ; to incorporate the word axes.
end     
