function first, filename

  readcol, filename, col0, col1, col2, format = 'A,A,A', delimiter = ',' ; reads all input data from a text file.

  return, transpose([[col0], [col1], [col2]]) ; returns a 3 by N array

end

function second, column, filename

  n_cols = n_elements(column)
  answers = strarr(n_cols)

  for i = 0, n_cols-1 do begin ; loops all elements in the column 
  input = ''
  read, 'Please provide a' + column[i] + ': ', input
  answers[i] = input
endfor

  outfile = 'output-' + repstr(filename, '.txt', '-')
  outfile += string(systime(/julian), format='(f0.6)') + '.txt'
  openw, 1, outfile
  writeu, 1, answers + string(10b)
  close, 1
  return, answers   ; saves the answers and returns the data

end

function third, fst_col, answers, snd_col

  return, [fst_col, transpose(answers), snd_col] ; 3 by N array is mixed and mashed

end

pro print_output, output

  for i = 0, n_elements(output) / 3 - 1 do begin
  out0 = repstr(output[0, i], ';', '')
  out1 = repstr(output[1, i], ';', '')
  out2 = repstr(output[2, i], ';', '')
  print, out0, ' ', out1, out2
  endfor

end

pro final, filename
 
  columns = first(filename)
  answers = second(columns[2,*], filename)
  print_output, third(columns[0,*], answers, columns[1,*])

end
