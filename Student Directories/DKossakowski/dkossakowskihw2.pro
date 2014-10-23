pro main
;set the text file to a variable
filename = 'two.txt'
;call the function that goes through the columns of the file
x=file_reader(filename)
;y is the answer array that contains all the user's inputs
y=reader(x)
;z is the 3 x N-elements that has cols as such: 1) 1st col from original
;text 2) the answers 3) 2nd col from original text
z=combine(x,y)
;prints out the final array!
printout(z)
end

;INPUT: file
;OUTPUT: an array with the cols from the file
function file_reader, filename
;read the cols of the filename which are separated by ',' and they are strings
readcol, filename, col1, col2, col3, delimiter=',', format='A,A,A'
;create an empty 3 x n_elements(col1) string array
col_arr = MAKE_ARRAY(3,N_ELEMENTS(col1), /STRING)
;put the cols to corresponding col in array
col_arr[0,*]=col1
col_arr[1,*]=col2
col_arr[2,*]=col3
return, col_arr
end


;INPUT: the array made from the text file
;OUTPUT: the user's answers
;PURPOSE: asks the user for an answer, which stores it into an answers array
function reader, in_arr
  ;find the size of column in the array that is inputed
  size=N_ELEMENTS(in_arr[2,*])
  ;make the answers array the same size/elements as col3
  answers=STRARR(size)
i=0
while i LT size-1 DO BEGIN
   ;define response as a string before reading
   response=''
   ;ask the user for a response to whatever is in the 3rd row of the array
   READ, "Please provide a " + in_arr[2,i], response
   answers[i] = response
   i+=1
ENDWHILE
;save the answers
save, answers, filename = 'answers.sav'
return, answers
end

;INPUT: the original array, the answer array
;OUTPUT: a new array (3 x n-elements) w/ 1st col from the 1st col of
;original array, 2nd col from the answer array, 3rd col from the 2nd col
;of original array

function combine, original_arr, ans_arr
  ;make a new array that will be size 3 x elements in each row
  new_arr = MAKE_ARRAY(3,N_ELEMENTS(original_arr[2,*]), /STRING)
  ;put col1 from original array to the 1st col of the new array
  new_arr[0,*]=original_arr[0,*]
  ;put col2 from original array to the 3rd col of the new array
  new_arr[2,*]=original_arr[1,*]
  ;need to transpose answer array
  ans_arr=transpose(ans_arr)
  ;put the answer array to the 2nd col of the new array
  new_arr[1,*]=ans_arr[0,*]
  ;return the array
  return, new_arr
end

;INPUT: the final array, fully edited
;OUTPUT: prints each row with all columns in that row
function printout, final_arr
  size=N_ELEMENTS(final_arr[2,*])
  i=0
  while i LT size - 1 DO BEGIN
     print, final_arr[*,i]
     i+=1
     ENDWHILE
end




