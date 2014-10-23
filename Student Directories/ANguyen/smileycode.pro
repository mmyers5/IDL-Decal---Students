pro happiness
  R = MAKE_ARRAY(dimension=100, /INTEGER, VALUE = 100);let's start off with just making the face before eyes and mouth. I set the radius to be 100 
  theta = findgen(100);I guess ranging theta from 0 to 99 in integer steps is enough points
  pplot = POLARPLOT(r, theta, 'b*', TITLE='My Polar Plot');this plots the head
  ;happiness IS OVER
end
pro smiley
   points = (2 * !PI / 99.0) * FINDGEN(100);this creates the array containing all the angles i want it to draw a point at
   xcenter=0;center of the head is at origin
   ycenter=0;""
   radius=100;the head will have radius of 100
   x = xcenter + radius * COS(points );formula of a circle 
   y = ycenter + radius * SIN(points );formula of a circle
   plot, x, y;make the head
   xcenterrighteye=50;center the right eye at (50,50)
   ycenterrighteye=50;center the right eye at (50, 50)
   radiuseye=25;make the eyes a quarter size of the head
   xrighteye = xcenterrighteye + radiuseye * COS(points );create the x points for the right eye
   yrighteye = ycenterrighteye + radiuseye * SIN(points );create the y points for the right eye
   OPLOT, xrighteye, yrighteye;overlay the right eye on hte head plot
   xcenterlefteye=-50;center left eye at (50,-50)
   ycenterlefteye=50;""
   xlefteye = xcenterlefteye + radiuseye * COS(points );create x points for left eye
   ylefteye = ycenterlefteye + radiuseye * SIN(points );create y points for left eye
   oplot, xlefteye, yrighteye;overlay right eye
   smilepoints=FINDGEN(100);defines the x values i want ot plot the parabola
   xsmileright=smilepoints;i want to plot both positve an negative values of x and currently findgen only makes positve numbers so I need ot make a positve list and negative list
   xsmileleft=-smilepoints;making negative list
   ysmile=.01*(smilepoints)^2-75 ;defining the y points i want to graph over. the details of the parabola is 7th grade math so i shouldn't need to go over the coefficients in detal. basically the first coefficient is small to make parabola really open and the last coefficient lowers it so the smile doesnt overlap the nose
   OPLOT, xsmileright, ysmile;plot the right part of the smile
   OPLOT, xsmileleft, ysmile;overlay left side
end
