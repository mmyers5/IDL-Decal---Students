pro fake_out
     readcol, 'clues.txt', clues, format = 'A'

     
     c1 = strlowcase(strmid(clues(0),0,1))        ;;denote first clue as c1, lowercase the extracted letter in the first line, first position, and only one letter, of clues
     f = c1                                       ;;final string will be f


     c2a = strpos(clues, 'og')                    ;;denote first part of second clue as c2a ;find where the 'og' exists in the array 'clues'
     c2b = where(c2a GT -1)                       ;;denote c2b as the numerical value (line) where og lives
     c2c = strmid(clues(c2b),0,2)                 ;;denote c2c as the extraction of og from this location (in the first position with as many elements needed)
     f+=c2c
    

     c3 = '_'                                     ;;denote third clue as an underscore
     f+=c3
 

     c4a = strpos(clues, 'ate')                   ;;denote first part of fourth clue as c4a, find where 'ate' exists in clues
     c4b = where(c4a GT -1)                       ;;denote c4b as the numerical value where 'ate' exists in array
     c4c = strpos(clues(c4b),'p')                 ;;denote c4c as the numerical value where 'p' exists within the string that has 'ate'
     c4d = strmid(clues(c4b),c4c,3)               ;;denote c4d as the extraction of 4 elements beginning at 'p' (c4c) within the string where 'ate' lives (c4b)
     f+=c4d


     c5a = where(strpos(clues,'x',0) GE 0)        ;;denote c5a as the numerical value where x exists in the array
     c5b = strmid(clues(c5a),0,2)                 ;;denote c5b as the extraction of 2 elements at the beginning of the string within the string where x is found
     f+=c5b
     

     c6a = [c1, c2c, c3, c4d, c5b]                ;;denote c6a as the collapsed final string composed of five previous clues
     c6b = strjoin(c6a)                           ;;join elements of c6a


     c7a = strpos(f, 'o', /REVERSE_SEARCH)        ;;find 'o' in f searching from back to front
     f = strmid(f, 0, c7a) + repstr(strmid(f,c7a), 'o', '')       ;;extract this o and replace it with nothing


     f+='.pro'                                    ;;add .pro to end of final string
     print, f                                     ;;f = logprax.pro
     print, clues                                 ;;Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge me for finding an amusing way to incorporate the word axes.
end     
