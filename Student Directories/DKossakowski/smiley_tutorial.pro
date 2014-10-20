pro smiley_tutorial

;circle for the smiley face
theta=2*!PI*findgen(100)/100
r_circle=10
x=r_circle*cos(theta)
y=r_circle*sin(theta)

r_eye=1
;right eye
x3=findgen(400)/100 + 2.5
y3=4+(-(x3-3.5)^2 + r_eye)^(1./2)
y4=4-(-(x3-3.5)^2 + r_eye)^(1./2)
;left eye
x4=findgen(400)/100 - 4.5
y5=4+(-(x4+3.5)^2 + r_eye)^(1./2)
y6=4-(-(x4+3.5)^2 + r_eye)^(1./2)

;smile (half circle)
theta=!PI*findgen(100)/100
r_smile=5
x6=r_smile*cos(theta)
y8=-r_smile*sin(theta)

;the plots
plot,x,y
oplot, x3, y3
oplot, x3, y4
oplot, x4, y5
oplot, x4, y6
oplot, x6, y8

end
