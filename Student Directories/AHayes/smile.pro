

pro make_smiley

;;; general formula for circle centered at x0,y0 with radius r is 
;;; r^2 = (x-x0)^2 + (y-y0)^2 becomes y = y0 +/- sqrt(r^2 - (x-x0)^2)
;;; we have one circle with radius 5 centered at (5,5)
;;; we have one half circle with radius 2.5 centered at (5,5)
;;; we have two circles of radius 0.5 centered at (3,6) and (7,6)

  ; initialize the x dimension, radii, and center positions for each circle
  x_array = findgen(100)*0.1
  radii = [5., 4., 0.5, 0.5]
  center_x = [5., 5., 3., 7.]
  center_y = [5., 5., 6., 6.]

  ; graph the outer circle
  y_array = center_y(0) + SQRT(radii(0)^2 - (x_array - center_x(0))^2)
  plot, x_array, y_array, xrange= [0,10], yrange= [0,10], title='Smiley', xtitle= 'left-right', ytitle= 'up-down'
  y_array = center_y(0) - SQRT(radii(0)^2 - (x_array - center_x(0))^2)
  oplot, x_array, y_array
  
  ; graph the smile
  y_array = center_y(1) - SQRT(radii(1)^2 - (x_array - center_x(1))^2)
  oplot, x_array, y_array

  ; graph the leftmost eye
  y_array = center_y(2) + SQRT(radii(2)^2 - (x_array - center_x(2))^2)
  oplot, x_array, y_array
  y_array = center_y(2) - SQRT(radii(2)^2 - (x_array - center_x(2))^2)
  oplot, x_array, y_array

  ; graph the rightmost eye
  y_array = center_y(3) + SQRT(radii(3)^2 - (x_array - center_x(3))^2)
  oplot, x_array, y_array
  y_array = center_y(3) - SQRT(radii(3)^2 - (x_array - center_x(3))^2)
  oplot, x_array, y_array

end
