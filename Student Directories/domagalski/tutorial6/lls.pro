; Linear least squares tutorial. This impliments the matrix solution to LLS.

function x_vector, x
    ; Set up the A matrix of LLS for a degree-one polynomial
    return, transpose([[x], [fltarr(n_elements(x))+1]])
end

function find_coeffs, xprime, y
    ; This function does the matrix operations of LLS and returns the
    ; fitted coefficients
    xt = transpose(xprime)
    mpsi = invert(xprime # xt) ; Moore-Penrose pseudoinverse
    A_partial = xt # mpsi
    return, y # A_Partial
end

function regression, xdata, fitvalues
    ; This function does things and stuff.
    return, xdata # fitvalues 
end

pro main, infile
    ; Read in data and compute the linear fit coefficients.
    readcol, infile, xdata, ydata, format='F,F'
    coeffs = find_coeffs(x_vector(xdata), transpose(ydata))

    ; Create the plot of the data.
    title = 'y = ' + string(coeffs[1]) + ' +' + string(coeffs[0]) + '* x'
    title = repstr(repstr(repstr(title, ' ', ''), '=', ' = '), '+', ' + ')
    data = plot(xdata, ydata, 'ko', xtitle='x', ytitle='y', title=title)
    fit  = plot(xdata, regression(xdata, coeffs), 'r-', /overplot)
end
