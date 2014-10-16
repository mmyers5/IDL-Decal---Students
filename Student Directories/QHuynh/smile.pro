pro smileyface
;;;making shape of face
points=(2*!PI/50.)*findgen(100) ;;;definining an array of points to be plugged into x and y component functions
x=5+5*cos(points)
y=5+5*sin(points)               ;;;component functions follows form center + radius*cos/sin
plot, x, y

;;;making left eye, following same procedure as above
leftx=3+0.5*cos(points)
lefty=6+0.5*sin(points)
oplot, leftx, lefty

;;;making right eye
righteye=(2*!PI/50.)*findgen(100)
rightx=7+0.5*cos(points)
righty=6+0.5*sin(points)
oplot, rightx, righty

;;;making smile
smilepoints=-(!PI/100.)*findgen(100)   ;;;points are redefined since only a semi circle is used (pi, not 2pi)
smilex=5+2*cos(smilepoints)
smiley=3+1*sin(smilepoints)
oplot, smilex, smiley
end
