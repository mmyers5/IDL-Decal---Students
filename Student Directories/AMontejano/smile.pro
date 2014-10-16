pro smiley
;;going to create a smiley face

;;this is the step to make the face
  points=(2*!pi/99.0)*findgen(100) ;sets thh basic points used to create circles
  radius=10                        ;sets the radius for the large circle
  xcenter=0                        ;sets the origin to be at x=0
  ycenter=0                        ;sets the orgin to be at y=0
  x=xcenter+radius*cos(points)     ;creates the x axis values
  y=ycenter+radius*sin(points)     ;creates the y axis values
  plot,x,y                         ;plots 

;;this is the step to make the left eye
  xcenterLeye=-5                ;creates the center of the x-axis to be -5
  ycenterLeye=5                 ;creates the center of the y-axis to be 5
  Lradius=1.5                   ;creates the radius of the circle to be 1.5
  u=xcenterLeye+Lradius*cos(points) ;creates the "x" axis, using the position 
  v=ycenterLeye+Lradius*sin(points) ;creates the "y" axis
  oplot,u,v                         ;creates a plot over the face instead of overwriting the face plot

;;This is the step to make the right eye
  xcenterReye=5                 ;creates the center of the x-axis to be 5
  ycenterReye=5                 ;creates the center of teh y-axis to be 5
  Rradius=1.5                   ;sets teh radius of the eye to be 1.5
  a=xcenterReye+Rradius*cos(points) ;creates the "x" axis
  b=ycenterReye+Rradius*sin(points) ;creates the "y" axis
  oplot,a,b                         ;creates a plot over the face instead of overwriting the face plot and the left eye

;;this is the step to make the smile
  point=(-!pi/99.0)*findgen(100) ;sets the basic points used to create half circles
  xsmile=0                       ;creates the center of the x-axis to be 0
  ysmile=0                       ;creates the center of the y-axis to be 0
  radiussmile=5                  ;sets the radis of the smile to be 5
  C=xsmile+radiussmile*cos(point) ;creates the "x" axis
  D=ysmile+radiussmile*sin(point) ;creates the "y" axis
  oplot,C,D                       ;creates a plot over the face instead of overwriting the face plot and the left/right eyes


end


