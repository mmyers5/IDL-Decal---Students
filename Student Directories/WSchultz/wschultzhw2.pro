function madlib

  readcol, 'one.txt', col1, col2, col3, format='A,A,A',delim=','

  outline = [[col1],[col2],[col3]]
  real_outline = transpose(outline)
  
  return, real_outline
end

function input, outline
  answers = indgen(n_elements(outline[2])-1, /string)
  for k=0, n_elements(outline[2])-1 DO BEGIN
     response = ''
     read, "Please provide a "+outline[2,k], response
     answers[k] = response
  endfor
  save, answers, filename = 'answers.sav'
  return, answers
end

function mix, outline, answers
  lol = [[outline[0:*]],[outlines[1:*]],[answers]]
  return, lol
end

pro printresult, lol
  for i=0, n_elements(lol[1:*]) DO BEGIN
     print, lol[0,k], lol[1,k], lol[2,k]
  endfor
end

pro main
  outline = madlib()
  answers = input(outline)
  funny = mix(outline, answers)
  printresult, funny
end
