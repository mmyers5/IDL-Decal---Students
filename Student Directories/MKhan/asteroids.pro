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
;Once this procedure is run, the spaceship will be plotted in as a triangle.

function rotation, xy, Xang=angX, Yang=angY, DEGREES=deg, ROTMAT = rotmat

; this function rotates array of (x,y) coordinates. Order of rotations
; is first around Y-axis, then X-axis.

  if N_elements(angX) NE 1 then angX=0
  if N_elements(angY) NE 1 then angY=0

  if keyword_set(deg) then begin
     rady = angY*!DTOR
     radx = angX*!DTOR
  endif else begin
     rady = angY
     radx = angX
  endelse

  if (rady EQ 0) then begin
     ca = 1
     sa = 0
  endif else begin
     ca = cos(rady)
     sa = sin(rady)
  endelse

rotY = [ [ca, 0] , $
         [ 0, 1] ]

  if (radx EQ 0) then begin
     ca = 1
     sa = 0
  endif else begin
     ca = cos(radx)
     sa = sin(radx)
  endelse

rotX = [ [1,  0] , $
         [0, ca] ] , $

rotmat = rotX # rotY ; this will give the 2 by 2 rotation matrix
s = size(xy)

if (s(0) EQ 2) AND (s(2) EQ 3) then return, xy # transpose(rotmat) $
   else return, rotmat # xy

end


FUNCTION CIRCLE, xcenter, ycenter, radius
   points = (2 * !PI / 99.0) * FINDGEN(100)
   x = xcenter + radius * COS(points )
   y = ycenter + radius * SIN(points )
   RETURN, TRANSPOSE([[x],[y]])
   END


PRO PolarPlot, radius, angle

IF N_Params() EQ 0 THEN BEGIN
   angle = ((Randomu(seed, 360)*360) - 180) * !DtoR
   radius = Randomu(seed, 360) * 100
ENDIF

; this adds a bunch of stars in the background. Majority of the stars
; will be around the spaceship. (I tried to use randomu command,
; but it doesn't work)

END
pro rocks, MK = mk, OO = oo, DN = dn, xx, rad, r0

rock1 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,-1,-1,0],[0,0,-1,-1,0],[0,0,0,0,0]] ; this rock will be in the shape of square
rock2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,-1,0,0],[0,-1,-1,-1,0],[0,0,0,0,0]] ; this rock will be in the shape of a triangle

if keyword_set(MK) then begin

rock1 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]; m
rock2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]; k

end

score = 10 ; spaceship destroys a rock

delay = 0.10

if keyword_set(OO) then begin

rock1 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,-1,-1,0],[0,0,-1,-1,0],[0,0,0,0,0]] 
rock2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,-1,0,0],[0,-1,-1,-1,0],[0,0,0,0,0]] 

end

score = 0; spcaeship misses a rock

delay =0.10

if keyword_set(DN) then begin

rock1 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
rock2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]

end

score = 0; rock destroys the spaceship

if DN EQ [4:6] then begin  ; [4:6] is the array which defines the x-range of the spaceship. If a rock is in that range, it destroys the spaceship.

print, 'You loose!' ; User looses the game

end

xx = findgen(2)*0.1 ; array incrementing with step 0.1
rad = 5*[1, 2./3, 1./4, 1./4] ; radii of various shapes corresponding to head, smile, eyes
r0 = [ [5,5],[5,5],[2.5,7.5],[7.5,7.5] ] ; initializes tuples of centers of shapes

; the above shapes are various objects that will fly in the space along
; with rocks.

while i EQ MK, OO DO BEGIN

 for i = 1 to 25 do begin
    print, 'You win' ; User wins the game
 endfor

i=i+1

endwhile

end
