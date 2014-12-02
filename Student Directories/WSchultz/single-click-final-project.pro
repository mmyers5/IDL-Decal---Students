pro prepare_yourself  ;FOR COMMENTS SEE MULTI-CLICK VERSION
  screen = replicate(0.0, 200, 200) 
  loadct, 13, /silent
  display, screen, min=-1, max=1, title='Are You Ready For This?', xtitle='Click anywhere on the graph to begin...' 
  cursor, x, y 

  t0 = -float(!pi/2.) 
  s = 1.0 
  inc = float(!pi/5.) 

  i=0.0
  wavenum = 0
  while i LT 300 do begin
     screen = replicate(0.0, 200, 200)

     ts = t0+(s)*inc
     dt = 0

     for j=s, wavenum +19, -1. do begin
        tj = t0 + ((j-i))*inc
        
 
        k=0
        n=2
        q=2

        while k LT 2*!pi do begin
           if j-i GT 0 then begin
              xk = round((j-i)*cos(k)+x)
              yk = round((j-i)*sin(k)+y) 
           endif
           if j-i EQ 0 then begin
              xk = x
              yk = y
            ;  print, 0
           endif
           
           if xk LT 0 then begin
              xk = -1*xk
           endif
           if xk GT 199 then begin
              xk = 399-xk
              n+=1
           endif
           if xk LT 0 then begin
              xk = -1*xk
           endif
           if yk LT 0 then begin
              yk = -1*yk
           endif
           if yk GT 199 then begin
              yk = 399-yk
              q+=1
           endif
           if yk LT 0 then begin
              yk = -1*yk
           endif

           if j-i EQ 0 then begin
              xk = x
              yk = y
           endif

              if screen[xk,yk] NE 0 then begin
                 screen[xk,yk] = screen[xk,yk] + cos(dt)
              endif else begin       
                 screen[xk,yk] = cos(dt)
              endelse
           k+=!pi/((j+1)*5.)
        endwhile
        dt += inc
     endfor
     loadct, 13, /silent, bottom=-5 
     
     display, screen, min=-5, max=5

     wait, 0.001
     s+=2.0
     if s GT 40 then begin
        wavenum +=2
     endif
     i+=1
  endwhile
end
