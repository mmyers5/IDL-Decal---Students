function x_vector, x_values
	one= make_array(1,n_elements(x_values)	) +1
	;print, one
	col_vector = [transpose(x_values), one]
	;print, col_vector	
	return, col_vector

end

function find_coeffs, xprime, y
	a = transpose(xprime) ## xprime
	inverse_square = invert(a)
	dot1 = inverse_square ## transpose(xprime)
	dot2 = dot1 ## y

	return, (invert(transpose(xprime) ## xprime) ## transpose(xprime) ## y)

end

function regressthing, xprime, Avector
	return, ((xprime) ## Avector)
	
end
; none of these work with it
;jk
pro main
	readcol, "data.dat", x,y, format = 'F,F'
;	x_prime = x_vector(x)
	
;	final = regressthing(x_prime,coeffs)
;	print, final
	psopen, 'swag.ps'
	x_prime=x_vector(x)
	coeffs = find_coeffs(x_prime,y)
	y_prime = regressthing(x_prime, coeffs) 
	plot, x,y, psym =1, title='helya', xtitle='x vals', ytitle='y vals'
	oplot, x, y_prime
	oplot, x, coeffs[0]*x + coeffs[1]
	psclose
end
