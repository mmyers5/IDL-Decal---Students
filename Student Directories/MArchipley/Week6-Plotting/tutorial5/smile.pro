pro smile

  ;making the circle for the face/head
  thetaf=2*!PI*findgen(100)/100                   ;define thetaf as 2 times the value of pi to make a circle ;use array of 100 floats (divided by 100 indicates many points)
  rf=10                                           ;define rf (radius) as 10
  xf=rf*cos(thetaf)                               ;use math knowledge to define x and y
  yf=rf*sin(thetaf)
  plot, xf, yf                                    ;plot the circle

  ;making the right eye
  thetar=2*!PI*findgen(100)/100                   ;define thetar as a full circle
  rr=1
  xr=rr*cos(thetar)+4                             ;translate the eyeball by 4 units in both directions
  yr=rr*sin(thetar)+4
  oplot, xr, yr                                   ;use oplot to plot over the face circle

  ;making the left eye
  thetal=2*!PI*findgen(100)/100
  rl=1
  xl=rl*cos(thetal)-4                             ;translate left eyeball by -4 units in only the x direction
  yl=rl*sin(thetal)+4
  oplot, xl, yl

  ;making the smile itself
  thetas=!PI*findgen(100)/100                     ;want half a circle, so only pi instead of 2pi
  rs=5
  xs=-rs*cos(thetas)                              ;negative x and y components to get it facing up
  ys=-rs*sin(thetas)
  oplot, xs, ys

end
