pro fake_out

     readcol, 'clues.txt', clues, format = 'A'       ; clues has the strings from file separated by whitespace
     
     theWord = strarr(10)                            ; dk how to initialize array with variable length
     theWord[0] = strlowcase(STRMID(clues[0], 0, 1)) ; first element declared
     
     FOR i = 0, N_ELEMENTS(clues)-1 DO BEGIN         ; loop through every string in file
        
        ; find the word with substring 'og' and extract
        ; add a '_'
        IF STRMATCH(clues[i], '*og*', /FOLD_CASE) EQ 1 THEN BEGIN
           ogIndex = STRPOS(clues[i], 'og')
           seg1 = STRMID(clues[i], ogIndex, 2)       ; I don't see the point of extracting a string
           theWord[1] = seg1 + '_'                   ; that I already know is 'og' -.-
        ENDIF
        
        ; find string containing 'ate' and extract 3 letters after p
        IF STRMATCH(clues[i], '*ate*', /FOLD_CASE) EQ 1 THEN BEGIN
           ateIndex = STRPOS(clues[i], 'p')
           seg2 = STRMID(clues[i], ateIndex, 3)
           theWord[2] = seg2
        ENDIF
        
        ; find string containing 'x' and extract first two letters
        IF STRMATCH(clues[i], '*x*', /FOLD_CASE) EQ 1 THEN BEGIN
           seg3 = STRMID(clues[i], 0, 2)             ; there are two instances of axes
           theWord[3] = seg3                         ; same letters get overwritten on second instance, so nobody cares
        ENDIF

     ENDFOR
     
     bird = STRJOIN(theWord)                         ; bird is the word (joins array elements into one string)
     
    ; delete second 'o' in bird.
    ; didn't use /reverse_search b/c didn't want to presuppose two o's
     first = STRPOS(bird, 'o')                       ; find first 'o'
     second = STRPOS(bird, 'o', first+1)             ; find second 'o'
     STRPUT, bird, ' ', second                       ; replace second 'o' with whitespace
     bird = STRCOMPRESS(bird, /REMOVE_ALL)           ; most round-about way to delete a character from a string
     
     bird = bird + '.pro'                            ; add .pro
     print, bird

end     

; Printing clues indicates that : Lumberjack fantasies have me oggling
; axes with less prudent intentions. Don't judge me for finding
; an amusing way to incorporate the word axes.
