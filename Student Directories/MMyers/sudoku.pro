pro start_puzzle, puzzleArray

  puzzleArray = MAKE_ARRAY(9, 9, /INTEGER, VALUE = 0)        ; initialize blank sudoku puzzle, indexed [col, row]
  print, "You will now be asked to fill in your puzzle."  
  a = ''
  READ, a, PROMPT = "How many numbers are in your puzzle right now? "
  a = fix(a)
  
  FOR start = 1, a DO BEGIN
     i = ''                                               
     j = ''
     READ, i, PROMPT = "I'd like to fill in row # "
     READ, j, PROMPT = "I'd like to fill in column # "
     i = fix(i)
     j = fix(j)
     k = ''
     READ, k, PROMPT = "My number is: "
     k = fix(k)
     puzzleArray[j-1,i-1] = k                                ; add proper values to puzzle
  ENDFOR
  
  solve_puzzle, puzzleArray
  
end

pro solve_puzzle, puzzle
    
  block_check, puzzle, grand
  row_col_check, puzzle, grandRow, grandCol
  
  ; start plugging in numbers to upLeft
  upLeft = puzzle[0:2,0:2]
  FOR ele = 0, 8 DO BEGIN                                            ; for each element in block
     IF upLeft[ele] EQ 0 THEN BEGIN                                  ; if element in block is empty
        ind = ARRAY_INDICES(upLeft, ele)                             ; gets 2d index for location we're filling in. ind has [col,row]
        FOREACH ele2, grand[*,0] DO BEGIN                            ; for each element in allowed list for block
          
           IF ele2 NE 0 THEN BEGIN                                   ; grab first nonzero allowed number
              ch1 = WHERE(grandRow[*, ind[1]] EQ ele2, COUNT)        ; check if ele2 is in row allowed
              ch2 = WHERE(grandCol[ind[0], *] EQ ele2, COUNT)        ; check if ele2 is in col allowed
              
              IF ch1 GE 0 AND ch2 GE 0 THEN BEGIN                    ; if neither lists prohibit it
                 upLeft[ind[0], ind[1]] = ele2                       ; store proposed number into block area
                 grand[where(grand[*,0] EQ ele2)] = 0                ; update allowed list for blocks
                 grandRow[where(grandRow[*, ind[1]] EQ ele2)] = 0    ; update allowed list for rows
                 grandCol[where(grandCol[ind[0], *] EQ ele2)] = 0    ; update allowed list for cols
              ENDIF
           ENDIF
        ENDFOREACH
     ENDIF
  ENDFOR

  print, upLeft
              
end

pro block_me, puzzle, upLeft, upMid, upRight, midLeft, midMid, midRight, lowLeft, lowMid, lowRight
  
  ; chunking the puzzle in appropriate pieces

  upLeft = puzzle[0:2,0:2]
  upMid = puzzle[3:5,0:2]
  upRight = puzzle[6:8,0:2]

  midLeft = puzzle[0:2, 3:5]
  midMid = puzzle[3:5, 3:5]
  midRight = puzzle[6:8, 3:5]
  
  lowLeft = puzzle[0:2, 6:8]
  lowMid = puzzle[3:5, 6:8]
  lowRight = puzzle[6:8, 6:8]
  RETURN

end

pro block_check, puzzle, grand, upLeft  
  grand = MAKE_ARRAY(9, 9, /INTEGER)                         ; making a list of allowed integers per block
  line = 1 + INDGEN(9)                                       ; make numbers go from 1 to 9
 
  FOR row = 0, 8 DO BEGIN
     grand[*,row] = line                                     ; row in this array is the block numbering as listed above
  ENDFOR
  
  block_me, puzzle, upLeft, upMid, upRight, midLeft, midMid, midRight, lowLeft, lowMid, lowRight
  
  ; holy tits this is poorly designed
  ; checks each block to weed out unwanted integers in the grand array
  
  grand[*,0] = banking(upLeft, grand[*,0])
  grand[*,1] = banking(upMid, grand[*,1])
  grand[*,2] = banking(upRight, grand[*,2])
  grand[*,3] = banking(midLeft, grand[*,3])
  grand[*,4] = banking(midMid, grand[*,4])
  grand[*,5] = banking(midRight, grand[*,5])
  grand[*,6] = banking(lowLeft, grand[*,6])
  grand[*,7] = banking(lowMid, grand[*,7])
  grand[*,8] = banking(lowRight, grand[*,8])
  
  RETURN

end


pro row_col_check, puzzle, grandRow, grandCol
  grandRow = MAKE_ARRAY(9,9, /INTEGER)                                       ; specifies possible val for rows
  grandCol = MAKE_ARRAY(9,9, /INTEGER)                                       ; specifies possible val for cols
  line = 1 + INDGEN(9)
  FOR rowCol = 0, 8 DO BEGIN
     grandRow[*, rowCol] = line                                              ; initialize grandRow to have all possible val
     grandRow[*, rowCol] = banking(puzzle[*,rowCol], grandRow[*,rowCol])     ; remove impossible vals from row info
     grandCol[rowCol, *] = line                                              ; initialize grandCol to have all possible val
     grandCol[rowCol, *] = banking(puzzle[rowCol,*], grandCol[rowCol,*])     ; remove impossible vals from col info
  ENDFOR

  RETURN

end
  
function banking, mainArray, subArray
                                ; subArray is a 1D array with which
                                ; elements are to be checked. mainArray
                                ; could be a 3x3, row, or column,
                                ; whichever way, mainArray has nine elements

  FOR i = 0, 8 DO BEGIN
     check = mainArray[i]                                    ; identify check value in list
     subArray[WHERE(subArray EQ check, /NULL)] = 0           ; if check value found, set element in array to 0, effectively removing invalid integers from subArray
  ENDFOR
  
  return, subArray
end
