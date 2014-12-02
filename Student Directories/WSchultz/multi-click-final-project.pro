pro prepare_yourself
  screen = replicate(0.0, 200, 200) ; creates a blank screen of 0s
  loadct, 13, /silent;,  ncolors=6 ; loads color table
  display, screen, min=-1, max=1, title='Are You Ready For This?', xtitle='Click anywhere on the graph to begin...' ; Displays the screen and asks user for click

  read, n, prompt='Enter number of clicks ' ; gets the number of clicks
  numelems = list();make_array(n, /integer,  value =0)

  t0 = -float(!pi/2.) ;initial theta value
  s = 1.0 ; starting number
  inc = float(!pi/5.) ; incrementation of theta with time

  i=0.0 ; while incriment
  wavenum = 0 ; removal interable

  for m=0, n-1, 1.  do begin
     print,  'Choose your points'
     cursor, x, y, /down
     numelems.add, [x,y] ; makes an array for the cursor position of clicks
  endfor

  read, wid, prompt='Enter width of line (0 smallest, must be even, smaller values run faster but look less pretty): ' ; gets width of lines from user

  if wid mod 2 NE 0 then begin
     print, 'fuck you joe!' ; checks for dinguses
  endif

  print, 'press Ctrl-C to stop' ; make sure dinguses can stop the code

  while i LT 300 do begin
     screen = replicate(0.0, 200, 200) ; remakes a blank screen to remove any unwanted interference
     for m=0, n_elements(numelems)-1, 1.  do begin ; runs through each click and replots the rainbow ring
        ts = t0+(s)*inc
        dt = 0
        
        for j=s, wavenum +19, -1. do begin ;iteration to plot the rings within each ring
           tj = t0 + ((j-i))*inc
        
 
           k=0
           n=2
           q=2
           
           while k LT 2*!pi do begin
              if j-i GT 0 then begin
                 xk = round((j-i)*cos(k)+numelems[m,0])
                 yk = round((j-i)*sin(k)+numelems[m,1]) ; makes circle but not very nice at low values
              endif

              if j-i EQ 0 then begin
                 xk = numelems[m,0]
                 yk = numelems[m,1] ; makes sure the center is a dot

              endif

              if xk LT 0 then begin    ;This is all boundry checking ...
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
              endif                    ; this is where boundary checking ends
              

              if screen[xk,yk] NE 0 then begin ; if the pixel is not empty it adds the values, otherwise it just plots
                 screen[xk,yk] = screen[xk,yk] + cos(dt)
              endif else begin       
                 screen[xk,yk] = cos(dt)
              endelse
              k+=!pi/((j+1)*5.) ;addition to make circle nicer 
           endwhile
           dt += inc
        endfor   
     endfor 
     loadct, 13, /silent, bottom=-5 ; loads a colortable to make things nice
     
     display, screen, min=-5, max=5 ;displays imafe
     wait, .001 ; makes sure the image is displayed
     s+=2.0
     if s GT 20 + wid then begin ;makes the width specified by user
        wavenum +=2
     endif
     i+=1 ; increases i cause the while loops gotta end sometime
  endwhile
  
end
