pro sad_face

  xx = findgen(100)*0.1                                      ; array incrementing from 0 - 10 with step 0.1
  rad = 5*[1, 2./3, 1./4, 1./4]                              ; radii of various shapes corresponding to head, smile, eyes
  r0 = [ [5,5],[5,5],[2.5,7.5],[7.5,7.5] ]                   ; initializes tuples of centers of shapes

  ; headplot and initializing basics of plot

  yy = circlenator(xx, rad[0], r0[0,0], r0[1,0])             ; get function of circle
  plot, xx, yy[*,0], xrange = [0,10], yrange = [0,10], title = 'The feelz', xtitle = 'left-right', ytitle = 'top-bottom'
  oplot, xx, yy[*,1]                                         ; plot of lower half of circle 

  ; smile plot
  yy = circlenator(xx, rad[1], r0[0,1], r0[1,1])
  oplot, xx, yy[*,1]

  ; left eye plot
  yy = circlenator(xx, rad[2], r0[0,2], r0[1,2])
  oplot, xx, yy[*,0]
  oplot, xx, yy[*,1]

  ; right eye plot
  yy = circlenator(xx, rad[3], r0[0,3], r0[1,3])
  oplot, xx, yy[*,0]
  oplot, xx, yy[*,1]

end

function circlenator, x, R, x0, y0
  
  ; function generates circle function in Cartesian coords

  ; Parameters
  ; ----------
  ; x: array
  ;  grid of x values 
  ; R: float
  ;  specifies radius of circle
  ; x0: float
  ;  specifies x-coordinate of center of circle
  ; y0: float
  ;  specifies y-coordinate of center of circle
  ;
  ; Returns
  ; ----------
  ; yy: array
  ;  grid of y values corresponding to input x values, makin' circles

  y = SQRT((R)^2 - (x - x0)^2)
  yy = [ [y0+y], [y0-y] ]
  return, yy
end
