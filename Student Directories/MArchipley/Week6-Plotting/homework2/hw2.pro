function step2
  readcol, 'one.txt', col1, col2, col3, format='A,A,A',delim=',' ;read in the one.txt file and assign first three columns to variables to format each column as strings separated by commas                                         
  step2array = strarr(3,n_elements(col1)) ;make an array of three columns by n rows of col1   
  step2array[0,*] = col1 ;column1
  step2array[1,*] = col2 ;column2
  step2array[2,*] = col3 ;column3

  return, step2array ;return my array at the end of the function
end


function step3, column3 ;parameter is column3
  userinput = '' ;delimits with a space
 
  answers = strarr(n_elements(column3)) ;answers is the array of strings of n elements in my parameter

  for i=0, n_elements(column3)-1 do begin ;for loop indexes from 0 until as many elements in column3
     read, "Please provide a "+column3[i], userinput ;loop reads each noun, adjective, etc. and puts it in a user input
     answers[i] = userinput ;fill the array from before the loop with the user inputs
  endfor

  save, answers, filename = 'answersfile.sav' ;saves the user input as a separate file

  return, answers
end


function step4, column1, column2, ansarray ;three parameters for the new, final array
  sentarray = strarr(3,n_elements(column1)) ;sentence array made from 3 columns and n element rows
  sentarray[0,*] = column1 ;actual column 1
  sentarray[1,*] = ansarray ;answer array in the physical column 2
  sentarray[2,*] = column2 ;column 2 in the physical column 3
  return, sentarray
end


pro step5, verses ;parameter for printing the sentences
  for i=0, n_elements(verses[1,*])-1 do begin ;for loop indexes from 0 to n elements in verses
     print, verses[0, i], verses[1, i], verses[2, i] ;prints the columns
  endfor
end


pro main ;main procedure calls all previous functions
    step2final = step2() ;step2 has no parameters
    step3final = step3(step2final[2,*]) ;step3 references parameters from step2
    step4final = step4(step2final[0,*], step2final[1,*], step3final) ;step4 references pieces from different functions
    step5, step4final ;step5 is a procedure so it's written differently
end
