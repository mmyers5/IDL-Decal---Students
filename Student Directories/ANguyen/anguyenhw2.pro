pro homework2
  readcol, 'three.txt', leaf, bud, flower, format='A,A,A', delimiter=',';readcol the txt file and put them into three seperate arrays
  onion=[leaf, bud, flower];combine 3 arrays of readcol into one
  answers=MAKE_ARRAY(31, /string, VALUE = 0);make an array to put the answeres in to.
  for n= 0, 30 do begin;ask the 30 something questions in the text file for me to respond to.
     response=''
     read, 'Please provide a '+flower[n], response
     answers[n]=response
  endfor
  save, answers, filename='answers.sav' ;save the answers in to the file
  mix=[[leaf], [answers], [bud]];mix and mash in part 4
  print, mix;I want to see mix
  for n=0, 30 do begin 
     print, mix[n, 0], mix[n, 1], mix[n, 2]
  endfor
end
