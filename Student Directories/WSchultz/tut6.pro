
function x_vector, xvals
  ones = make_array(n_elements(xvals)) + 1. ;makes an array of ones which allow me to fin the constant
  matx = [[xvals],[ones]] ;adds the x values and the ones into an array to use
  xcol = transpose(matx) ; corrects the row issue of the row dominant matrix format of idl so that we can acutally think of the thing correctly
  return, xcol ; returns the columnized matrix of x
end

function find_coeffs, xcol, yvals
  A = invert(transpose(xcol) ## xcol) ## transpose(xcol) ## yvals ; uses the matrix algebra equation to find the coefficients
  return, A ; returns a column of the coefficient values
end

function regress, xcol, A
  yfit = xcol ## A ; uses the initial y values to compute the y values of the best fit line
  return, yfit ; returns those y values
end

pro main
  readcol, 'tut6data.dat', xvals, yvals ; reads in data
  plot, xvals, yvals, psym=2 ; plots the raw points of the data
  xcol = x_vector(xvals) ; runs x_vector to get the x colunm matrix
  coeffs = find_coeffs(xcol, yvals) ; fins the coeffiecients
  yfit = regress(xcol, coeffs) ; creates the y values of the best fir
  oplot, xvals, yfit ;plots the best fit line over the points
end ; ends the main fuction because idl is stoooooooooopid
