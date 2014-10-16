pro smile
  x = findgen(101)/10
  a = 5
  b = 5
  y = (25 - (x - a)^2 )^(0.5) + b
  z = b - (25 - (x - a)^2)^(0.5)

  plot, x, y, title='TGIAF'
     axis, ytitle='Top-Bottom', xtitle='Left-Right', xrange=[0,10]
  oplot, x, z
  
  y2 = sqrt(.25 - (x-3)^2.) + 6
  z2 = 6 - sqrt(.25 - (x-3)^2.)

  oplot, x, y2, color='FF0000'X
  oplot, x, z2, color='FF0000'X
  
  y3 = sqrt(.25 - (x-7)^2.) + 6
  z3 = 6 - sqrt(.25 - (x-7)^2.)

  oplot, x, y3, color='FF0000'X
  oplot, x, z3, color='FF0000'X

  y4 = 5 - sqrt(16 - (x-5)^2)

  oplot, x, y4, color= color24(255,0,0)

end
