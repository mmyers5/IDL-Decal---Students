pro main

  readcol, 'data.dat', x0, y0, format = 'F,F'       ; read in data
  xVec = x_vector(x0)                               ; get x-vectors
  A = find_coeffs(xVec, y0)                         ; get slope and intercept
  yVec = regress(xVec, A)                           ; get fitted y-vectors

  m = string(A[0])                                   
  b = string(A[1])
  set_plot, 'PS'                                    ; for saving plot
  device, filename = 'tut6.ps'
  myPlot = 'y = ' + m + 'x + ' + b                                            ; title of plot
  plot, x0, y0, title = myPlot, xtitle = 'X values', ytitle = 'Y values'      ; plot scatterplot
  oplot, x0, yVec                                                             ; plot line over plot plot
  device, /CLOSE

END

function x_vector, x0
  
  dim1 = n_elements(x0)                               ; dimension 1 size (a.k.a. number of rows)
  xVec = make_array(dim1, 2, /FLOAT, VALUE = 1.)      ; make array of appropriate size, initialize values of 1
  xVec[*,0] = x0                                      ; put x value in first array
  xVec = transpose(xVec)                              ; turn into a column vector
  return, xVec

END

function find_coeffs, xVec, y0
  
  xTx = transpose(xVec) ## xVec                       ; first part of equation
  A = invert(xTx) ## transpose(xVec) ## y0
  
  return, A
END

function regress, xVec, A

  yVec = xVec ## A                                    ; perform linear regression thing
  return, yVec

END
