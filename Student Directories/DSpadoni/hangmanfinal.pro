;Darren Spadoni & Melanie Archipley
;Monday, November 24, 2014 final IDL project submission


function chooseword, wordlist ;user is assigned a word from the wordlist by inputting a number that corresponds to a word's position ;empty string that we put something into  
  numberchoice = 0
  read, numberchoice, PROMPT='To select a word (possible words are celestial bodies), enter a number between 1 and 41: ' ;reads the sentence and prompts the user to input 
  if (numberchoice GE 1) AND (numberchoice LE 41) THEN BEGIN
     userword = wordlist[numberchoice-1] ;this is the word (as a string) from the wordlist in the position that the user chooses
  endif ELSE BEGIN
     while (numberchoice LT 1) OR (numberchoice GT 41) DO BEGIN ;if this doesn't happen, prompt the user for a different number - wanted to fix the error when user enters a letter, couldn't figure it out
        print, 'Numbers 1-41 onlyyyyyyyy'
        read, numberchoice
        if (numberchoice GE 1) AND (numberchoice LE 41) THEN BREAK ;when the user finally inputs a correct number, start the game
     endwhile
     if (numberchoice GE 1) AND (numberchoice LE 41) THEN BEGIN ;reassign the corrected number (this is probably redundant but it works soooo)
        userword = wordlist[numberchoice-1]
     endif
  endelse
  return, userword
end


function splitword, userword ;function splits the userword into strings in an array so we can work with it
  numberofletters = strlen(userword) ;assign a variable that we can index to the length of the word
  letterarray = '' ;empty string that we put something into
  for i=0, numberofletters-1 DO BEGIN ;for loop goes through the word and extracts substrings of length 1
     letterarray = [letterarray, strmid(userword, i, 1)] ;puts these strings into an array
  endfor
return, letterarray ;return the word in array form
end


pro displayhangman, guesses ;this plots the gallows first then subsequently plots the body parts as guesses decrease
  thetah = 2*!PI*findgen(100)/100 ;sets up the head
  rh = 0.5 ;radius
  xh = rh*cos(thetah)+6 ;plots the head at a certain translation
  yh = rh*sin(thetah)+6.5
  SWITCH guesses of ;for each guess they miss, count down and plot one part for each successive wrong letter
      0: oplot, [6,7],[3,2] ;right leg
      1: oplot, [6,5],[3,2] ;left leg
      2: oplot, [6,7],[5,6] ;right arm
      3: oplot, [5,6],[6,5] ;left arm
      4: oplot, [6,6,6,6],[3,4,5,6] ;torso
      5: oplot, xh, yh ;head gets plotted first
  endswitch
end


pro main

  liststars = ['Acrux','Aldebaran','Antares','Arcturus','Bellatrix','Betelgeuse','Dubhe','Polaris','Pollux','Procyon','Sirius','Spica','Vega'] ;13 word options                    
  listplanetsandmoons = ['Mercury','Venus','Earth','Mars','Jupiter','Saturn','Uranus','Neptune','Phobos','Deimos','Io','Europa','Callisto','Enceladus','Prometheus','Dione','Titan','Ariel','Oberon','Charon'] ;20 word options                                                                                            
  listgalaxiesandnebulae = ['MilkyWay','Sombrero','Whirpool','Andromeda','Triangulum','Cone','Horsehead','Trifid'] ;8 word options                                                 
  wordlist = [strupcase(liststars), strupcase(listplanetsandmoons), strupcase(listgalaxiesandnebulae)] ;creates an array of above word options, 41 total, user enters -40 to 41 

  playagainchoice = 'Y' 
  while playagainchoice EQ 'Y' DO BEGIN ;begin playing - this will be true until user is asked to play again after they finish once

     userword = chooseword(wordlist) ;call chooseword(pass the list) and return the word that corresponds to user's chosen number
     numberofletters2 = strlen(userword) ;determine length of the word so splitword can place each character in the string into its own array element
     splitwordfinal = splitword(userword)

     emptyarray = make_array(numberofletters2, 1, /string, value='_') ;make an underscore array the size of the word to show the user
     print, emptyarray                                                ;print this once at the beginning to show user how many letters their word is
     print, 'You have six incorrect guesses before you are hung. Type any letter (A-Z) to begin playing!' ;prompt user to enter a letter that is then checked in the whileloop

     randomletter = 0           ;assigning some dummy variable to be used for the while loop 
     guesses = 6                ;how many guesses the user is given, will be used later
     playagain = ''

     plot, findgen(10), color=1 ;plots the gallows first (as soon as user inputs any guess)
     oplot, [1,2,3], [1,1,1] ;bottom line
     oplot, [2,2,2,2,2,2,2,2], [1,2,3,4,5,6,7,8] ;long vertical line
     oplot, [2,3,4,5,6], [8,8,8,8,8] ;top line
     oplot, [6,6], [7,8] ;noose
     
        while randomletter EQ 0 DO BEGIN ;using a while loop to (1) check if input is 1 or more letters (prompts again if >1), (2) checking if the letter is in the chosen word
           favoriteletter = ''  ;empty string that we put something into
           read, favoriteletter ;here is where the user's input goes
           capitalletter = strupcase(favoriteletter)
           letterinput = where(splitwordfinal EQ capitalletter, count) ;count argument makes letterinput the value of how many times the letter input occurs in the lettered array
           if count NE 0 THEN BEGIN ;count becomes its own variable, if it doesn't equal to zero, then the letter exists
              letterexist = 1 ;letter exists
           endif ELSE BEGIN
              letterexist = 0 ;letter does not exist
           endelse

           if letterexist EQ 1 THEN BEGIN                       ;refer back to conditional statements just made, here's where we do stuff if the letter exists
              print, 'There exists a(n) "'+capitalletter+'"!'   ;let user feel good about him/herself
              for i=0, numberofletters2 DO BEGIN                ;index from start of word to end of word
                 if splitwordfinal[i] EQ capitalletter THEN BEGIN ;for each letter, if it equals the input letter...
                    emptyarray[i-1] = capitalletter             ;...then replace the underscore with that letter
                 endif
              endfor
           
              for i=0, numberofletters2 DO BEGIN  ;here's where we end the program onc(e the user has completed the word
                 if i EQ numberofletters2 THEN BEGIN ;if the index equals the number of letters, do stuff - this is important because we want the full word to be analyzed at once
                    print, 'You win this time, nerd.' ;the user has won the game if this happens
                    randomletter = 1                 ;this breaks the while loop (because the while loop is dependent on randomletter equalling 0)
                    thetae = 2*!PI*findgen(100)/100
                    re = 0.1 ;radius                                                                                                                                             
                    xe = re*cos(thetae)+5.75 ;plots eyeballs for a smiley face that prints only if user wins                                    
                    ye = re*sin(thetae)+6.65
                    oplot, xe, ye
                    xer = re*cos(thetae)+6.25
                    yer = re*sin(thetae)+6.65
                    oplot, xer, yer
                    thetas = !PI*findgen(100)/100 ;plots mouth
                    rs = 0.25
                    xs = -rs*cos(thetas)+6
                    ys = -rs*sin(thetas)+6.4
                    oplot, xs, ys
                 endif ELSE BEGIN
                    if emptyarray[i-1] EQ '_' THEN BREAK ;if the elements in the array equal an underscore, the user has not completed the word,
                 endelse
              endfor
           endif
           print, emptyarray

           if strlen(capitalletter) NE 1 THEN BEGIN ;if the user tries to input more than one letter, don't let them
              print, 'One letter at a time :('      ;this does not use up a guess
           endif ELSE BEGIN
              if letterexist EQ 0 THEN BEGIN                                                       ;refer back to conditional statements previously made
                 print, 'WRONG-O. Try another letter! You have',guesses-1,' body parts remaining.' ;this shows the user how many more tries they have before the game is over
                 guesses = guesses-1                                                               ;decrease one guess each time

                 displayhangman, guesses ;here we call the procedure that shows hangman

                 if guesses EQ 0 THEN BEGIN ;here's where the game ends when guesses run out
                    print, 'GAME OVER, loser - your word was:', splitwordfinal
                    oplot, [5.70, 5.90], [6.35, 6.75] ;plotting x's for eyes
                    oplot, [5.70, 5.90], [6.75, 6.35]
                    oplot, [6.10, 6.30], [6.35, 6.75]
                    oplot, [6.10, 6.30], [6.75, 6.35]
                    thetas = !PI*findgen(100)/100 ;plotting the noose to be especially morbid
                    rs = 0.25
                    xs = -rs*cos(thetas)+6
                    ys = -rs*sin(thetas)+6
                    oplot, xs, ys
                    randomletter = 1
                 endif
              endif
           endelse
        endwhile
        
        read, playagain, PROMPT='Play again? Y/N: ' ;user can either start another word or exit - the entire while loop is specifically if "playagainchoice" = "y"
        playagainchoice = strupcase(playagain)
        if (playagainchoice NE 'N') AND (playagainchoice NE 'Y') THEN BEGIN
           print, 'Please enter either "Y" or "N" - you entered "',playagain,'"' ;;HOW THE FUCK DO YOU LOOP THIS TIL THEY DO Y/N
           read, playagain
           if (playagainchoice EQ 'N') OR (playagainchoice EQ 'Y') THEN BREAK ;this doesn't work how we want it to but we tried
        endif
     endwhile
end
