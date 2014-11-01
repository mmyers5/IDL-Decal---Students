function x_vector, x
  ones = fltarr(n_elements(x))
  ones = ones + 1
  x_prime = [[x], [ones]]
  return, x_prime
end

pro main
  readcol, "data.dat", x, y
  print, x_vector(x)
end
