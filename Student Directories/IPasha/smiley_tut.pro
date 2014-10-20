pro smiley
print, 'yo this ish plots a damn smiley face'

theta = indgen(1000)*2*!pi/(1000.)
x = sin(theta)
y = cos(theta)

smilex = .5*cos(theta/2.)
smiley = .5*sin(theta/2.)

xeye = .1*sin(theta) + .4
yeye = .1*cos(theta) + .4
xeye2 = .1*sin(theta)-.4

plot, x, y
oplot, smilex, smiley
oplot, xeye, yeye
oplot, xeye2, yeye

end