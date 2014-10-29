function read_data, file ;function for Reading in Data section
  readcol, file, col1, col2, col3, format = 'A,A,A', delim = ',' ;reads the file
  dataarr = make_array(3, n_elements(col1), /STRING)  ;make a 3 by n_elements(col1) string array
  ;COLS BEFORE ROWS
  dataarr[0,*] = col1                     ;set first column of temparray to be col1 from file
  dataarr[1,*] = col2                     ;similar to above for second column
  dataarr[2,*] = col3                     ;similar to above for third column
  return, dataarr
end


function askuser, col3 ;function for Input from User section
  answerarr = make_array(1, n_elements(col3), /STRING) ;;;make a 3 by n_elements(col3) string array
  for i = 0, n_elements(col3) -1 DO BEGIN   ;loops through all values of col3
     answer = ''
     read, "gimme a" + col3[i] + ' ', answer
     answerarr[i] = ' ' + answer                 ;asks user to provide an answer and put that answer into temparray2
  endfor
  save, answerarr, filename = 'answers.sav'
  return, answerarr
end


function combine, col1, col2, answerarr
  readcol, 'two.txt', col1, col2, col3, format = 'A,A,A', delim = ','
  sentencearr = make_array(3, n_elements(col3), /STRING)
  sentencearr[0,*] = col1
  sentencearr[1,*] = col2
  sentencearr[2,*] = answerarr
;combines column 1, column 2, and user answers into sentences organized
;by rows
  return, sentencearr
end 


pro readout, sentencearr
  for i = 0, n_elements(sentencearr) - 1  DO BEGIN
     print, sentencearr[0,i], sentencearr[1,i], sentencearr[2,i]
  endfor
end


pro mainpro
  file = 'two.txt'
  dataarray = read_data(file) 
  answerarray = askuser(dataarray[2,*])
  sentences = combine(dataarray[0,*], dataarray[1,*], answerarray)
  readout, sentences
end
