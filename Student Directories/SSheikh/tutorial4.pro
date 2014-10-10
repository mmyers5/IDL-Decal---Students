;Code to find the real name of a tutorial - like a treasure hunt, but
;                                           sometimes annoying!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     final = '' ;an empty string to start
     one = strlowcase(strmid(clues[0], 0, 1)) ;looks at the first element of clues, takes the first letter
        final = final + one
        print, final
     
     two_pos_array = strpos(clues, 'og') ;finds the position of 'og'
        elem_num = n_elements(two_pos_array) - 1
           FOR i = 0, elem_num DO BEGIN ;the position info is one number in an array, so I need to search through the array for that position
              IF two_pos_array[i] NE -1 THEN BEGIN
                 two_pos = i
                 num = two_pos_array[i]
              ENDIF
           ENDFOR
        two = strmid(clues[two_pos], num, 2) ;now that the position is known, I can take the slice I want
        final = final + two
        print, final
     
     three = '_' ;just adds a space
        final = final + three
        print, final 
    
     four_array = strpos(clues, 'ate')
        elem_num = n_elements(four_array) - 1 ;same idea as two
           FOR i = 0, elem_num DO BEGIN
              IF four_array[i] NE -1 THEN BEGIN
                 four_pos = i
              ENDIF
           ENDFOR
        line_in_question = clues[four_pos] ;with the position info, I find the line in question, and from there, the characters in question
        str_pos = strpos(line_in_question, 'p')
        four = strmid(line_in_question, str_pos, 3)
        final = final + four
        print, final

     five_array = strpos(clues, 'x') 
        elem_num = n_elements(five_array) - 1 ;same idea as four, finds the position
           FOR i = 0, elem_num DO BEGIN
              IF five_array[i] NE -1 THEN BEGIN
                 five_pos = i
              ENDIF
           ENDFOR
        word_in_question = clues[five_pos]
        five = strmid(word_in_question, 0, 2)
        final = final + five
        print, final

     clues = strjoin(strjoin(clues))

     seven_pos = strpos(final, 'o', /REVERSE_SEARCH) ;splits final into three strings - before the last 'o', at the last 'o', and after the last 'o'
         split_1 = strmid(final, 0, seven_pos)
         split_2 = strmid(final, seven_pos, 1)
         split_3 = strmid(final, seven_pos + 1, strlen(final))
         split_2 = repstr(split_2, 'o', '') ;changes the last 'o'
         final = split_1 + split_2 + split_3 ;sticks them back together again
         print, final

     eight = '.pro' 
     final = final + eight
     print, final
    
     print, clues

end     

;Lumberjackfantasieshavemeogglingaxeswithlessprudentintentions.Don'tjudgemeforfindinganamusingwaytoincorporatethewordaxes.
