
; i guess i should add comments

pro draw_smiley
  ;makes a parameter theta to use in sine and cosine
  teta = findgen(100) * 2 * !pi / 100.
  ;makes array for the head
  xhead = 5 * cos(teta) + 5
  yhead = 5 * sin(teta) + 5
  ; makes arrays for the left eye
  xleye = .75 * cos(teta) + 3
  yleye = .75 * sin(teta) + 6
  ;makes arrays for the right eye
  xreye = .75 * cos(teta) + 7
  yreye = .75 * sin(teta) + 6
  ; makes arrays for the left iris
  xleyei = .45 * cos(teta) + 3
  yleyei = .45 * sin(teta) + 6
  ;makes arrays for the right iris
  xreyei = .45 * cos(teta) + 7
  yreyei = .45 * sin(teta) + 6
  ;makes arrays for the smile
  xsmile = 4 * cos(teta/(-2.)) + 5
  ysmile = 4 * sin(teta/(-2.)) + 5
  ;loads the color table "rainbow"
  loadct, 13
  ;plots and overplots all the shit
  plot, xhead, yhead,title = 'Me on 10/17 - Weed', xtitle = 'Left side ... Right side... maybe', ytitle = 'Up and down... Im pretty sure about that one.'
  oplot, xleye, yleye, color = 82
  oplot, xreye, yreye, color = 20
  oplot, xleyei, yleyei, color = 20
  oplot, xreyei, yreyei, color = 82
  oplot, xsmile, ysmile, color = 119

end ; ends the program

;now time for thermo! lol.
