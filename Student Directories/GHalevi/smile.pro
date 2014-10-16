pro smile
  x = findgen(101)/10 ;setting x variable
  a = 5 
  b = 5 ;explicitly set center
  y = (25 - (x - a)^2 )^(0.5) + b ;top half of big circle
  z = b - (25 - (x - a)^2)^(0.5) ;bottom half

  plot, x, y, title='TGIAF' 
     axis, ytitle='Top-Bottom', xtitle='Left-Right', xrange=[0,10] ;titling axes and setting range
  oplot, x, z ;plots second half of big circle
  
  y2 = sqrt(.25 - (x-3)^2.) + 6
  z2 = 6 - sqrt(.25 - (x-3)^2.)

  oplot, x, y2, color='FF0000'X  ;plots first eye top half
  oplot, x, z2, color='FF0000'X  ;plots first eye bottom half
  
  y3 = sqrt(.25 - (x-7)^2.) + 6  
  z3 = 6 - sqrt(.25 - (x-7)^2.)

  oplot, x, y3, color='FF0000'X
  oplot, x, z3, color='FF0000'X  ;plots second eye

  y4 = 5 - sqrt(16 - (x-5)^2) 

  oplot, x, y4, color= color24(255,0,0)  ;plots mouth, the bottom half of a circle

end
