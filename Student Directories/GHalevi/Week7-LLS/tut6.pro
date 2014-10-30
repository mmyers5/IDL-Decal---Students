;input: x values of the data
;output: the xprime vector, consisting of a column of the x values and
;a column filled with ones

function x_vector, x_values
                                ;stores the number of data points we have
     num_values = n_elements(x_values)
                                ;creates an column of ones by creating
                                ;an empty vector as long as the number
                                ;of x_values we have and then adding
                                ;one to each entry
     array_of_ones = make_array(1, num_values) + 1
                                ;creates an array that has the
                                ;x_values as one column and the array
                                ;of all ones as the second column
     column_vector = [transpose(x_values), array_of_ones]
                                ;returns this new array
     return, column_vector

  end






;input: the x primed vector created in the first function and the y
;values of the data
;output: the A vector that is equal to the inverse of the transpose of x' times x' times the transpose of x' times the y values

function find_coeffs, x_prime, y
                                ;this creates the matrix that is the
                                ;product of x'T and x'
     first = transpose(x_prime) ## x_prime
                                ;this creates the A vector, the
                                ;product of this first matrix
                                ;and x'T and then y
     slope_vector = (invert(first) ## transpose(x_prime) ## y)
                                ;returns this A vector

return, slope_vector

end






;input: the x primed vector and the A vector
;output: the fitted y values

function regress, x_prime, A_vector
                                ;the fitted y-values are just the
                                ;product of the x prime vector and A
     return, ((x_prime) ## A_vector)

  end






;puts all of this together to actually plot the data and the
;regression

pro main
;reads in the data from the data.dat file into two variables, x and y,
;and has these data values as floats
     readcol, "data.dat", x, y, format = 'F,F'
     x_prime = x_vector(x)
     coefficients = find_coeffs(x_prime, y)
     y_prime = regress(x_prime, coefficients)
     m = string(coefficients[0])
     b = string(coefficients[1])
     title = 'y = ' + m + 'x + ' + b
     entry_device = !D.NAME & help, entry_device
     psopen, 'tut6.ps'
     ;plots the data points to create a scatter plot
     plot, x, y, psym = 2, title = 'y=' + m + 'x'+ b, xtitle = 'x values', ytitle = 'y values'
     ;overplots the best fit line
     oplot, x, m*x + b
     psclose     
end
