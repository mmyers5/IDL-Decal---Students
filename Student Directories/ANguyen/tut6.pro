function give_me_romeo, man1;creates the x_vector
  readcol, '/home/anguyen/ay98/github/Resources/Week7-LLS/data.dat', romeo, tristan
  one = MAKE_ARRAY(400, 1, /INTEGER, VALUE = 1) ;make 1 array for the x' matrix
  juliet=transpose([[romeo], [one]]); combine the x values and 1 into x' and call it juliet
  return, juliet
end 
function give_me_juliet_and_tristan, woman1, man2;creates find_coeffs
  readcol, '/home/anguyen/ay98/github/Resources/Week7-LLS/data.dat', romeo, tristan
  juliet= give_me_romeo(romeo)
  ;print, (invert(transpose(juliet) ## juliet) ## transpose(juliet))
  ;print, tristan
  ;print, size((invert(transpose(juliet) ## juliet) ## transpose(juliet)))
  ;print, size(tristan)
  pandarus=invert(transpose(juliet) ## juliet) ## transpose(juliet) ## tristan ;create A and call it pandarus
  return, pandarus
end
function give_me_juliet_pandarus, woman1, panderer;regresses
  readcol, '/home/anguyen/ay98/github/Resources/Week7-LLS/data.dat', romeo, tristan
  pandarus=give_me_juliet_and_tristan(juliet, tristan);changes A into pandarus
  juliet= give_me_romeo(romeo);get back juliet
  isolde=juliet ## pandarus;create y' and call it isolde
  return, isolde
end
pro main ;the men are the normal matrixes, the women are the primes. As feminsits say man is the norm and woman is the exception
  readcol, '/home/anguyen/ay98/github/Resources/Week7-LLS/data.dat', romeo, tristan;read all the data                                                                              
  juliet= give_me_romeo(romeo);reestablish juliet
  pandarus=give_me_juliet_and_tristan(juliet, tristan);reestablish A
  m=string(pandarus[0]);get the slope
  b=string(pandarus[1]);get the y intercept
  ;troilus='m';turn m into string and call it troilus
  ;cressida='b';turn b into string and call it cressida
  isolde=give_me_juliet_pandarus(juliet, pandarus);reestablish isolde
  plot, romeo, tristan, psym=3, title='y=' +m+ 'x+'+b, YTITLE='y', XTITLE='x' ;plot the scattered data with titles
  oplot, romeo, isolde, psym=-3                                               ;overlay the line of best fit
  psopen, 'linear regression';SAVE THE PLOT
  plot, romeo, tristan, psym=3, title='y=' +m+ 'x+'+b, YTITLE='y', XTITLE='x';plot the scattered data with titles
  oplot, romeo, isolde, psym=-3;overlay the line of best fit
  psclose
end

    
  
  
