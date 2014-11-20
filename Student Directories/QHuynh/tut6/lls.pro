;;x_vector function returning array xprime
function x_vector, datafile
  readcol, 'data.dat', col1, col2, format = 'F, F' ;;read data.dat
  xprime = make_array(2, n_elements(col1))         ;;make an array called x based on x-values in column 1
  for i = 0, n_elements(col1) - 1  DO BEGIN
     xprime[0,i] = col1[i]                         ;;set x-values in col1 to be values in first column of array xprime
  endfor
  xprime[1,*] = 1                                  ;;set second column of xprime to be of the value 1     
  return, xprime
end

;;y_vector function returning an array of y-values
function y_vector, datafile
  readcol, 'data.dat', col1, col2, format = 'F,F'
  y = make_array(1, n_elements(col2))              ;;make an array called y
  for i = 0, n_elements(col2) - 1 DO BEGIN
     y[i] = col2[i]                                ;;set y-values in col2 to be values in array y
  endfor
  return, y
end

;;find_coeffs function returning array A
function find_coeffs, xprime, y
  transxprime = transpose(xprime)                       ;;find transpose of xprime
  A = y # (transxprime # invert(xprime # transxprime))  ;;definition of A
  return, A
end

;;regress function 
function regress, xprime, A
  yprime = A # xprime
  return, yprime
end

pro mainlls
  datafile = 'data.dat'
  readcol, 'data.dat', col1, col2, format = 'F, F'
  xprimearray = x_vector(datafile)
  yarray = y_vector(datafile)
  Aarray = find_coeffs(xprimearray, yarray)
  yprimearray = regress(xprimearray, Aarray)
  graphtitle = 'y = ' + string(Aarray[0]) + 'x ' + string(Aarray[1])      ;;equation of line
  plot, col1, col2, psym = 3, xtitle = 'X-values', ytitle = 'Y-values', title = graphtitle
  oplot, yprimearray, LINESTYLE = 0, THICK = 2
end
