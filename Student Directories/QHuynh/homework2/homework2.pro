pro mainpro
  file = 'two.txt'
  dataarray = read_data(file) 
  answerarray = askuser(file)
  sentences = combine(dataarray[0,*], dataarray[1,*], answerarray]
  readout, sentences
end

function, read_data, file ;function for Reading in Data section
  readcol, file, col1, col2, col3, format = 'A,A,A', delim = ',' ;reads the file
  temparray = make_array(3, n_elements(col1), /STRING)  ;make a 3 by n_elements(col1) string array
  ;COLS BEFORE ROWS
  temparray[0,*] = col1                     ;set first column of temparray to be col1 from file
  temparray[1,*] = col2                     ;similar to above for second column
  temparray[2,*] = col3                     ;similar to above for third column
  return, temparray
end

function, askuser, file ;;;function for Input from User section
  temparray2 = make_array(1, n_elements(col3), /STRING) ;;;make a 3 by n_elements(col3) string array
  for i = 0, n_elements(col3), 1 DO BEGIN   ;loops through all values of col3
     answer = ' '
     read, "GIMME A " + col3[i], answer
     temparray2[i] = answer                 ;asks user to provide an answer and put that answer into temparray2
  endfor
  save, temparray2, filename = 'answers.sav'
  return, temparray2
end

function, combine, col1, col2, temparray2
  sentence = make_array(3, n_elements(col3), /STRING)
  sentence[0,*] = col1
  sentence[1,*] = col2
  sentence[2,*] = temparray2
;combines column 1, column 2, and user answers into sentences organized
;by rows
  return, sentence
end 

pro readout
  for i = 0, n_elements(col3) DO BEGIN
     print, sentence[*,i]
  endfor
end
