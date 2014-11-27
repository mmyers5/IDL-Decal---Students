
pro fishbowl, nFish


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The purpose of this program is to simulate the motion
;of schooling fish and their interaction with a shark
;or other predator. The fish will swim in a circle 
;around the origin and group together, while avoiding
;the shark if it gets too close.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;; Set timestep, maximum runtime, length of axis
dt = 1
tMax = 1000
L = 100
R = 0
z = 1
f = 0

n = nFish+1
;;; define fish variables
sight = 20
minDneighbor = 5
maxDcentroid = 35
minDfurthest = L
swimspeed = 2
maxSpeed = 2
minSpeed = 0.3
spacing = 0.5
dthreat = 60

;;; initialize empty position and velocity arrays
xPosFish = fltarr(n)
yPosFish = fltarr(n)
zPosFish = fltarr(n)
xVelFish = fltarr(n)
yVelFish = fltarr(n)
zVelFish = fltarr(n)


;;; Set initial conditions
for j = 1,nFish do begin
    while (sqrt((xPosFish(j)-L/2)^2+(yPosFish(j)-L/2)^2+zPosFish(j)-L/2) GT L/2) do begin
        xPosFish(j) = L*(randomu(seed))
        yPosFish(j) = L*(randomu(seed))
        zPosFish(j) = L*(randomu(seed)-0.5)
    endwhile
    xVelFish(j) = - 1
endfor





;;; Begin time steps
for t = 1,tMax do begin
    
    xPosShark = xPosFish(0)
    yPosShark = yPosFish(0)
    zPosShark = zPosFish(0)
    xVelShark = xVelFish(0)
    yVelShark = yVelFish(0)
    zVelShark = zVelFish(0)
    
    r = randomu(seed)

    ;;; Accelerate the shark one of 4 random directions
    if (r LT 0.25) then begin
        xVelShark = xVelShark + 1
        yVelShark = yVelShark + 1
    endif else if (r LT 0.5) then begin
        xVelShark = xVelShark - 1
        yVelShark = yVelShark + 1
    endif else if (r LT 0.75) then begin
        xVelShark = xVelShark + 1
        yVelShark = yVelShark - 1
    endif else begin
        xVelShark = xVelShark - 1
        yVelShark = yVelShark - 1
    endelse
    

    ;;; Move the shark away from the edges
    if (abs(xPosShark) GT 3*L/4) then begin
        xVelShark = -xVelShark
    endif
    if (abs(yPosShark) GT 3*L/4) then begin
        yVelShark = -yVelShark
    endif
    

    ;;; Slow down the shark
    while (sqrt(xVelShark^2+yVelShark^2) GT maxSpeed+1) do begin
        xVelShark = 0.9*xVelShark
        yVelShark = 0.9*yVelShark
    endwhile
    
    

    ;;; Reenter the shark values into the array
    xPosFish(0) = xPosShark + dt*xVelShark
    yPosFish(0) = yPosShark + dt*yVelShark
    zPosFish(0) = zPosShark + dt*zVelShark
    xVelFish(0) = xVelShark
    yVelFish(0) = yVelShark
    zVelFish(0) = zVelShark

    
    
    
    ;;; Begin iteration over the fish
    for i = 1,nFish do begin
        xPosCur = xPosFish(i)
        yPosCur = yPosFish(i)
        zPosCur = zPosFish(i)
        xVelCur = xVelFish(i)
        yVelCur = yVelFish(i)
        zVelCur = zVelFish(i)
        
        xtot = 0
        ytot = 0
        ztot = 0
        xvtot = 0
        yvtot = 0
        zvtot = 0
        dxmax = 0
        dymax = 0
        dzmax = 0
        dmax = 0
        dxmin = 100
        dymin = 100
        dzmin = 100
        dmin = 100
        

        ;;; Find the min and max distances to other fish
        for k = 1,nFish do begin
            xtot = xtot + xPosFish(k)
            ytot = ytot + yPosFish(k)
            ztot = ztot + zPosFish(k)
            xvtot = xvtot + xVelFish(k)
            yvtot = yvtot + yVelFish(k)
            zvtot = zvtot + zVelFish(k)
            dx = xPosCur - xPosFish(k)
            dy = yPosCur - yPosFish(k)
            dz = zPosCur - zPosFish(k)
            
            if (sqrt(dx^2+dy^2+dz^2) GT dmax) then begin
                dxmax = dx
                dymax = dy
                dzmax = dz
                dmax = sqrt(dx^2+dy^2+dz^2)
            endif else if (sqrt(dx^2+dy^2+dz^2) LT dmin) then begin
                dxmin = dx
                dymin = dy
                dzmin = dz
                dmin = sqrt(dx^2+dy^2+dz^2)
             endif

        endfor
        

        ;;; Calculate averages and centroid
        xcentroid = xtot/(nFish-1)
        ycentroid = ytot/(nFish-1)
        zcentroid = ztot/(nFish-1)
        dcentroid = sqrt((xcentroid-xPosCur)^2+(ycentroid-yPosCur)^2+(zcentroid-zPosCur)^2)
       
        xVelAvg = xvtot/(nFish-1)
        yVelAvg = yvtot/(nFish-1)
        zVelAvg = zvtot/(nFish-1)
        

        ;;; If too far from centroid, move towards centroid
        if (dcentroid GT maxDcentroid) then begin
            dvxc = (xcentroid - xPosCur)/dcentroid
            dvyc = (ycentroid - yPosCur)/dcentroid
            dvzc = (zcentroid - zPosCur)/dcentroid
            
            xVelCur = xVelCur + 0.5*swimspeed*dvxc
            yVelCur = yVelCur + 0.5*swimspeed*dvyc
            zVelCur = zVelCur + 0.5*swimspeed*dvzc
        endif
        

        ;;; If velocity too far from average, go at average velocity
        if (xVelCur GT xVelAvg+1) OR (yVelCur GT yVelAvg+1) OR (zVelCur GT zVelAvg+1) then begin
            xVelCur = xVelAvg
            yVelCur = yVelAvg
            zVelCur = zVelAvg
        endif

        
        ;;; Move in a circle
        if (xPosCur GT 0) AND (yPosCur GT 0) then begin
            xVelCur = xVelCur -0.1
        endif else if (xPosCur LT 0) AND (yPosCur GT 0) then begin
            yVelCur = yVelCur -0.1
        endif else if (xPosCur LT 0) AND (yPosCur LT 0) then begin
            xVelCur = xVelCur +0.1
        endif else if (xPosCur GT 0) AND (yPosCur LT 0) then begin
            yVelCur = yVelCur +0.1
        endif
        

        ;;; If too high or low, move towards z=0
        if (zPosCur GT L/2) then begin
            zVelCur = zVelCur -0.2
        endif else if (zPosCur LT -L/2) then begin
            zVelCur = zVelCur +0.2
        endif
        
        
        ;;; If the shark is close, move away
        dShark = sqrt((xPosShark-xPosCur)^2+(yPosShark-yPosCur)^2+(zPosShark-zPosCur)^2)
        if (dShark LT dthreat) then begin
            dvxShark = (xPosShark - xPosCur)/dShark
            dvyShark = (yPosShark - yPosCur)/dShark
            dvzShark = (zPosShark - zPosCur)/dShark
           
            xVelCur = xVelCur - 1.5*swimspeed*dvxShark
            yVelCur = yVelCur - 1.5*swimspeed*dvyShark
            zVelCur = zVelCur - 1.5*swimspeed*dvzShark
        endif
        
        ;;; Reduce high speeds
        while (sqrt(xVelCur^2+yVelCur^2+zVelCur^2) GT maxSpeed) do begin
            xVelCur = 0.9*xVelCur
            yVelCur = 0.9*yVelCur
            zVelCur = 0.9*zVelCur
        endwhile
        
        ;;; Update positions
        xPosFish(i) = xPosCur + dt*xVelCur
        yPosFish(i) = yPosCur + dt*yVelCur
        zPosFish(i) = zPosCur + dt*zVelCur
        xVelFish(i) = xVelCur
        yVelFish(i) = yVelCur
        zVelFish(i) = zVelCur
    endfor
    
    ;;; Plot the positions    

    LOADCT, 18, NCOLORS=!D.N_COLORS-1
    TVLCT, 70, 70, 70, !D.N_COLORS-1
    zcolors = BYTSCL(z, TOP=!D.N_COLORS-2)


    surface, dist(5), xrange=[-L,L], yrange=[-L,L], zrange=[-L, L], xstyle=1, $
      ystyle=1, zstyle=1, charsize=1.5, color=!D.N_COLORS-2, $
      background=!D.N_COLORS-1, $
      position=[0.1, 0.1, 0.95, 0.95, 0.1, 0.95]


    plots, xPosFish, yPosFish, zPosFish, PSYM=4, COLOR=zcolors, SYMSIZE=2.5, /T3D


endfor


end
