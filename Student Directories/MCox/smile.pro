pro smile
  x = (1./2)*findgen(21)
  y = (25 - (x - 5)^2)^(1./2) + 5
  plot, x, y
;This will plot the top half of the main outline of the smiley face.
  z = -(25 - (x - 5)^2)^(1./2) + 5
  oplot, x, z
;This will additionally plot the bottom half of the main outline of the smiley face.
  a = (1./10)*findgen(101)
  b = ((1 - (a - 3)^2))^(1./2) + 6
  oplot, a, b
;This will additionally plot the top half of the left eye in the smiley face.
  c = -((1 - (a - 3)^2))^(1./2) + 6
  oplot, a, c
;This will additionally plot the bottom half of the left eye in the smiley face.
  d = (1./10)*findgen(101)
  e = ((1 - (d - 7)^2))^(1./2) + 6
  oplot, d, e
;This will additionally plot the top half of the right eye in the smiley face.
  f = -((1- (d - 7)^2))^(1./2) + 6
  oplot, d, f
;This will additionally plot the bottom half of the right eye in the smiley face.
  q = (1./10)*findgen(101)
  r = -(8 - (q - 5)^2)^(1./2) + 5
  oplot, q, r
;This will addtionally plot the mouth in the smiley face.
end
;Now there should be a completed smiley face when all the points are plotted.
