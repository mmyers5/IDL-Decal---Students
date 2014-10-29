pro main
  filename = 'two.txt'
  ;setting your filename

  data_array = data_reader(filename)
                                ;this function will read the columns of
                                ;the file into IDL, and assemble them
                                ;into a 3 by n_elements(col3) array

  answers = question_asker(data_array[2,*])
                                ;this function will take the third
                                ;column of data_array, ask the user to
                                ;answer some questions, and output an
                                ;array of the answers

  sentences = sentence_maker(data_array[0,*], data_array[1,*], answers)
                                ;this function will take the first
                                ;column of data_array, the second column
                                ;of data_array, and the answers to the
                                ;questions, and put them into a new 3 by
                                ;n_elements(col3) sized array. The
                                ;answers will sit between the two
                                ;columns from the data set. This
                                ;function will also save that array

  sentence_reader, sentences
                                ;this procedure will read the sentences
                                ;out one at a time to the screen

end





;INPUT: the filename
;OUTPUT: an array full of the data
;ACTIONS: this function will read the columns of the file into IDL, and assemble them
         ;into a 3 by n_elements(col3) array
function data_reader, filename

  readcol, filename, col1, col2, col3, format = 'A,A,A', delim = ','
  ;reading in the data from the file into three variables

  data_arr = ;HOW DO I CREATE A STRING ARRAY WITH 3 BY N_ELEMENTS(COL3)?
  ;creating an array of empty strings to contain the values from the dataset

  data_arr[]=col1
  data_arr[]=col2
  data_arr[]=col3
  ;HOW DO I INDEX A MULTI-DIMENSIONAL ARRAY TO FILL IT WITH A VALUE?
  ;filling the array with the read values

  return, data_arr
  ;returns my array full of the values from the dataset
end








;INPUT: the values of column 3
;OUTPUT: an array of answers
;ACTIONS: this function will take the third column of data_array, ask the user to
         ;answer some questions, and output an array of the answers
function question_asker, values
  answer_arr = ;HOW DO I CREATE A STRING ARRAY WITH THE SAME NUMBER OF ELEMENTS AS VALUES?
  ;this creates an empty array to receive the answers to your questions

  for i = 0, ;(HOW DO I SET THE RANGE TO ITERATE THROUGH ALL THE ELEMENTS OF VALUES?) do begin
      dummy = ''
      read, 'Please provide a '+values[i], dummy
      answer_arr[i] = ' '+dummy
  endfor
  ;this will ask the user to provide an answer to every completed question

  save, answer_arr, filename = 'answers.sav'
  return, answer_arr
  ;returns my array full of the values from the dataset
end






;INPUT: data1, data2, answer_col
;OUTPUT: an 3 by n_elements(col3) array with all the sentences in the rows
;ACTIONS: this function will take the first column of data_array, the second column
          ;of data_array, and the answers to the questions, and put them into a new 3 by
          ;n_elements(col3) sized array. Theanswers will sit between the two
          ;columns from the data set. This function wil also save the array.
function sentence_maker, data1, data2, answer_col

  sentence_arr = ;HOW DO I CREATE A STRING ARRAY WITH 3 BY N_ELEMENTS(COL3)?
  ;this creates a 3 by n_elements(col3) string array to receive the values of
  ;the first and second data columns, as well as the answers

  sentence_arr[] = answer_col
  sentence_arr[] = data1
  sentence_arr[] = data2
  ;HOW DO I INDEX THESE ARRAYS TO FILL THE COLUMNS WITH THESE VALUES?
  ;this fills the array as desired by the instructions

  return, sentence_arr
end







;INPUT: a 3 by n_elements(col3) array containing the sentences created
       ;by sentence_maker
;OUTPUT: (none)
;ACTIONS: This procedure will print out each row of the array on a
         ;single line
pro sentence_reader, frases

  for i = 0, ;(HOW DO I INDEX THIS TO RUN THROUGH THE NUMBER OF ROWS IN FRASES) do begin
     print, frases[0,i], frases[1,i], frases[2,i]
  endfor
  ;prints out each sentence (each row of the frases array) one at a time

end
