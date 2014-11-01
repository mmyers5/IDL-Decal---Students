
;;; This procedure receives a text file and then breaks it apart
;;; and receives user input to output a sentence

pro main
  filename = 'two.txt'

  string_data = read_data(filename) ; Read the data and store it

  responses = get_input(string_data[2,*]) ; Get input from the user

  words = make_sentence(responses, string_data[0,*], string_data[1,*]) ; Combine the words

  print_sentence, words ; Print the result
end



;;; Reads in date from the file and stores the columns in a new array
function read_data, filename

  readcol, filename, col1, col2, col3, format='A,A,A', delim=',' ;read in the file
  
  string_data = MAKE_ARRAY(3, N_ELEMENTS(col1), /STRING) ; make 3 by n_elements(col1) array

  string_data[0,*] = col1
  string_data[1,*] = col2
  string_data[2,*] = col3

  return, string_data
end



;;; Asks the user for input and stores these responses in an array
;;; then saves that array
function get_input, values

  answers = StrArr(n_elements(values)) ; create an empty string array

  for i = 0 , n_elements(values) - 1  do begin ; iterate through and record answers
     response = ' ' 
     read, 'Please provide a' + values[i], response
     answers[i] = response
  endfor

  save, answers, filename = 'answers.sav' ; save the answer array

  return, answers
end



;;; Takes in the collected answers and the first two data columns
;;; and makes a sentence
function make_sentence, answer_column, data_col1, data_col2

  sentence = MAKE_ARRAY(3, n_elements(data_col1), /STRING)
  
  ;fill the sentence array with the answers and two data columns
  sentence[0,*] = answer_column
  sentence[1,*] = data_col1
  sentence[2,*] = data_col2

  return, sentence
end



;;; Iteratively prints the words in the setence
pro print_sentence, word_array
  
  sizeof = size(word_array)
  size_rows = sizeof(2)

  for i = 0, size_rows-1 do begin
     print, word_array[0,i], word_array[1,i], word_array[2,i] ; print the rows
  endfor

end
