function x_vector, datafile
 
  readcol, 'data.dat', col1, col2, format = 'F, F' 
  xprime = make_array(2, n_elements(col1)) ;creates an array called x with the help of x-values in the first column
  
  for i = 0, n_elements(col1) - 1 DO BEGIN
     xprime[0,i] = col1[i] ;sets x-values in col1 as the values of the first column of xprime array
  endfor
 
  xprime[1,*] = 1 ; makes the values of the second column of xprime as 1.
 
  return, xprime

end

function y_vector, datafile
 
  readcol, 'data.dat', col1, col2, format = 'F,F'
  y = make_array(1, n_elements(col2)) ; creates an array with n elements in the second column
 
  for i = 0, n_elements(col2) - 1 DO BEGIN
     y[i] = col2[i] ; sets the y-values in the second column as the values in the array y

  return, y

endfor

end


function find_coeffs, xprime, y

  transxprime = transpose(xprime)                     ; calculates the transpose of xprime
  A = y # (transxprime # invert(xprime # transxprime)) 
 
  return, A

end

function regress, xprime, A
 
  yprime = A # xprime          ; creates new fitted y-values
 
  return, yprime

end

pro mainlls, y_vector

psopen, 'plot.ps', xsize=5, ysize=5

  datafile = 'data.dat'
  readcol, 'data.dat', col1, col2, format = 'F, F'
  
  xprimearray = x_vector(datafile)
  yarray = y_vector(datafile)
  Aarray = find_coeffs(xprimearray, yarray)
  yprimearray = regress(xprimearray, Aarray)
  graphtitle = 'y = ' + string(Aarray[0]) + 'x ' + string(Aarray[1]) 

  plot, col1, col2, psym = 3, xtitle = 'X-values', ytitle = 'Y-values', title = graphtitle ; plots scatter plot of data
  oplot, yprimearray, LINESTYLE = 0, THICK = 2    ; plots line of best fit

psclose

end


