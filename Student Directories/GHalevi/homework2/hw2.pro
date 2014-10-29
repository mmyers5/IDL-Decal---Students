pro all
  myfile = 'two.txt'
  ;sets the file that I'll be using

  myarray = reader(myfile)
                                ;reads the columns of two.txt into a 3
                                ;by n_elements(col1) array

  responses = inputasker(myarray[2,*])
                                ;asks questions and outputs an array of answers

  combined = recombine(myarray[0,*], myarray[1,*], responses)
                                ;takes the first column of my array,
                                ;the second column, and the user
                                ;responses and places them into a new array

  readrows, combined
                                ;reads out each row iteratively

end





;the input for this function will be myfile, txt.two. the output will
;be an array of the data contained in myfile, and the
;function's purpose will be to read the columns of myfile into
;IDL and assemble them into a 3 by n_elements(col1) array

function reader, myfile

  readcol, myfile, col1, col2, col3, format = 'A,A,A', delim = ','
                                ;reads in the data from myfile, where
                                ;we have used format to indicate that
                                ;we are reading in string columns and
                                ;delim to indicate that the columns
                                ;are divided by commas
  
  dataarray = strarr[3,n_columns(col1)] ;creates a string array with dimensions 3 by n_elelements(col1)
  dataarray[0,*] = col1 ;first column of array
  dataarray[1,*] = col2 ;second column
  dataarray[2,*] = col3 ;third column
  return, dataarray
  ;returns the constructed array with the columns of data read into it
end






;the input for this function will be the things in the third column of
;two.txt, which are now in the third column of our new array. the
;output will be answers to these questions. the funciton will ask for
;answers to these questions and output an array containing the
;inputted answers

function inputasker, myarray[2,*]
  answerarray = strarr(n_elements(myarray[2,*]))
  ;creates empty array that we can fill with answers to the questions  
  
  for i = 0, n_elements(myarray[2,*])-1, do begin
      dummy = ''
      read, 'Please provide a '+values[i], dummy
      answerarray[i] = ' '+dummy
   endfor
   ;this asks for responses to every questions

   save, answerarray, myfile = 'responses.sav'
   return, answerarray
   ;returns an array that is now filled with responses
end







;takes the first column of myarray, second column of myarray, and the
;user responses the the questions from the previous functions and
;places them in a new array, which the funtion then saves.

function recombine, data1, data2, responses
  combinearray = strarr(3, n_elements(data1)
  combinearray[1,*] = answer_col
  combinearray[0,*] = data1
  combinearray[2,*] = data2
                                ;this fills the array with the answers
                                ;column in between the two as
                                ;instructed in the tutorial

  return, combinearray
end




;we are creating a procedure that will print out each row of the array
;on its own line

pro reader, combined
  for i = 0, n_elements(combined[0,*])-1, do begin
                                ;indexes up to the number of rows in
                                ;the first column of the combined
                                ;array, which is the same as the
                                ;number of rows in the entire array
  print, combined[0,i], combined[1,i], combined[2,i]
                                ;prints the entire row for each row by
                                ;printing the value in the first
                                ;column followed by the value in the
                                ;second column and then in the third
endfor

end
