pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
        ;the above function just reads in
        ;strings from the text file clues.txt
     
     solution = strarr()
        ;initializing the array with no set length

;1. extract the first letter of the first string in clues and make it
;   lowercase (use strlowcase)

     solution[0] = strlowcase(STRMID(clues[0], 0, 1))
        ;setting the first element in the
        ;solution string array to be the first
        ;letter of the first string in clues, made lowercase
     
;2. find the string containing the
;substring 'og' and extract it from that string
     
     for i=0, n_elements(clues)-1 do begin
        ;begins a for loop that goes through each string in clue
        if STRMATCH(clues[i], '*og*', /FOLD_CASE) EQ 1 then begin
           ;checks for elements in clues that
           ;match the substring og by setting them to
           ;equal 1, then runs this loop for
           ;that substring, using /fold_case to
           ;ignore wrong capitalization
           oglocation = STRPOS(clues[i], 'og')
              ;find the position of the og substring
           firstpart = STRMID(clues[i], oglocation, 2)
              ;extracts the og portion of the string containing og
   
;3. add in an '_'
     
           solution[1] = firstpart + '_'
        endif
     
;4. find the string containing 'ate' and extract 3 letters from the p on
        if STRMATCH(clues[i], '*ate*', /FOLD_CASE) EQ 1 then begin
        ;this is very similar to what we did for og
           atelocation = STRPOS(clues[i], 'p') 
              ;finds the location of the p
           secondpart = STRMID(clues[i], atelocation, 3) 
              ;extracts three letters from the word containing ate, 
              ;beginning with the letter p
           solution[3] = secondpart
        endif

;5. find the string containing 'x' and extract the first two letters
        if STRMATCH(clues[i], '*x*', /FOLD_CASE) EQ 1 then begin
           thirdpart = STRMID(clues[i], 0, 2)
           solution[3] = thirdpart
        endif
           ;finds the string containing 'x' and
           ;extracts the first two letters

     endfor
        ;can't forget to end loops!!

;6. use strjoin to collape your array into a single string
     actualtutorialname = STRJOIN(solution)
        ;joins all parts of the array into a new string

;7. use repstr to replace the second o in your string with ''
;   (try using the /reverse_search option in strpos)
        ;does this hint mean there are
        ;only two o's in our string? 
     o2 = STRPOS(actualtutorialname, '*o*', /reverse_search)
     REPSTR(actualtutorialname, o2, '')
        ;not sure if this will work because the second input should
        ;be a string to search for, not a position

;8. add in a '.pro'
    actualtutorialname = actualtutorialname + '.pro'
        ;adding .pro

;9. print your string and go find the file  in /home/jzalesky/public_html
;   and open it in emacs
    print, actualtutorialname
end     
