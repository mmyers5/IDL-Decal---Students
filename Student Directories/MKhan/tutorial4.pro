;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week
     
     ;please avoid simply printing clues to
     ;get an idea of what the strings 
     ;look like. The idea is to work with the
     ;functions within idl.

     ;FOLLOW THE FOLLOWING INSTRUCTIONS AND CONCATENATE THE RESULTS OF EACH INTO AN ARRAY
     
     ;1. extract the first letter of the first string in clues and make it
     ;   lowercase (use strlowcase)

     a=strlowcase(strmid(clues[0], 0,1)) ; finds and extracts the first letter of the first string                                           ; and makes it lowercase
                                         
    ; print, a

     ;2. find the string containing the substring 'og' and extract it from that
     ;string

     b=strpos(clues, 'og')               ; finds the position of 'og'
     
     for i=0, n_elements(b)-1 do begin
        
        if b[i] GT -1 then begin
           c = strmid(clues[i],b[i],2)    ; extract the substring 'og' from the string
           print, c

        end if

        end for

     ;3. add in an '_'

     d = strjoin([c, '-'])
     ;print, d

     ;4. find the string containing 'ate' and extract 3 letters from the p on

     e = strpos(clues, 'ate')      ;finds the locations of 'ate' and 'p' and extracts them
     f = strpos(clues, 'p')
      
     for i=0, n_elements(e)-1 do begin
        
        if e[i] GT -1 then begin
           
           for j=0, n_elements(f)-1 do begin
              
              if f[j] GT -1 then begin
           
           g = strmid(clues[i],f[j],3)       ; extracts 3 letters
           print, g

        end if

           end for

        end if

     end for

     
     ;5. find the string containing 'x' and extract the first two letters

     h = strpos(clues, 'x')     ; finds the string containing 'x'

      for i=0, n_elements(h)-1 do begin
        
        if h[i] GT -1 then begin
              
           
           l = strmid(clues[i], 0, 2)  ; extracts the first two letters
           print, l

        end if

           end for
     
     ;6. use strjoin to collape your array into a single string

      m = strjoin([a,d,g,l])      ; makes the array in a string
      ;print, m
     
     
     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)      
    
      n = strpos(m, 'o', /reverse_search)
      o = strmid(m, 0, n) + repstr(strmid(m, n),'o') ; replaces the second 'o' in the string with ''
      ;print, o


     ;8. add in a '.pro'

      x = strjoin([o, '.pro'])  ; adds .pro in the string
    

     ;9. print your string l

      print, x

     ;  and go find the file  in /home/jzalesky/public_html and open it in emacs
        
      print, clues

        ;Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge me for 
        ;finding an amusing way to incorporate the word axes.

      
end     
