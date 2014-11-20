pro spaceship
x = indgen(10)
y = x
plot, x[4:6], y[5:7], xrange = [0,10], yrange = [0,10]
;This will plot one of the lines needed to create the spaceship, and
;create the graph from 0-10 in the x-axis and y-axis.
a = indgen(10)
b = -a + 8
oplot, a[4:6], b[3:5]
;This will plot the second line needed to create the spaceship.
s=findgen(5)
s=s+3
r=intarr(5)
r=r+6
oplot, r, s
;This will plot the final line needed to create the spaceship.
end
;Once this procedure is run, the spaceship will be ploted in as a triangle.

pro rotation
k = ROT(spaceship, 90)
plot, k
end

pro rocks
end
