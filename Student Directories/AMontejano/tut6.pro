
Function xvector,xval
;;this function takes our values and makes them into a 1 by many vector
  Column_of_one=make_array(1,n_elements(xval))+1.0 ;makes an empty column that adds one to each value
  transpose_xvec=[transpose(xval), column_of_one] ;takes that column, transpose it and multiplies by the original values
 return,transpose_xvec
 end

Function findcoeffs, xprime,yval
;; takes our xvector we made and take the y values of the data and
;; outputs a new 2 by something vector which we call the A vector

  transpose_matrix_product_xprime= transpose(xprime) ## xprime ;multiplies the transpose xprime matrix with xprime
  Avector=[invert(transpose_matrix_product_xprime)  ## transpose(xprime) ## yval] ;multiples the inverted matrix product of c and multiples that with xprime transpose and y
  return,Avector
end

Function regress, xprime, Avector
;;creates yprime by matrix multiple xprime and SuperA vector
  yprime=[xprime ## Avector]
  return,yprime
end


pro main
;;calls up the data and uses it to plot a line

  readcol, 'data.dat', x, y, format="F,F"
  xprime=xvector(x)
  coef=findcoeffs(xprime,y)
  yprime=regress(xprime,coef)
  b=string(coef[1])
  m=string(coef[0])
  title= "y= "+m+"x + "+b
 ; psopen, 'squareline.ps'
  plot, x,y, psym=3, title="y="+m+"x"+b, xtitle="x", ytitle="y" ;plots all the points
  oplot,x, m*x+b                ;creates the best fit line
 ; psclose
end

