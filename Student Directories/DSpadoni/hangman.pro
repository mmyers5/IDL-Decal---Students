;;    ==============================================================================
;;WEDNESDAY NOV 19 SUBMISSION - will touch up before monday presentatio
;;    ==============================================================================
;; MELANIE ARCHIPLEY               DARREN SPADONI                       
;;
;;












function chooseword, wordlist ;user is assigned a word from the wordlist by inputting a number that corresponds to a word's position
  numberchoice = '' ;empty string that we put something into
  read, numberchoice, PROMPT='To select a word (all astro-related nouns), enter a number between -40 and 41: ' ;reads the sentence and prompts the user to input a number
  userword = wordlist[numberchoice-1] ;this is the word (as a string) from the wordlist in the position that the user chooses
  return, userword ;return the chosen word
end


function splitword, userword ;function splits the userword into strings in an array so we can work with it
  numberofletters = strlen(userword) ;assign a variable that we can index to the length of the word
  letterarray = '' ;empty string that we put something into
  for i=0, numberofletters-1 DO BEGIN ;for loop goes through the word and extracts substrings of length 1
     letterarray = [letterarray, strmid(userword, i, 1)] ;puts these strings into an array
  endfor
return, letterarray ;return the word in array form
end


pro main

  liststars = ['Acrux','Aldebaran','Antares','Arcturus','Bellatrix','Betelgeuse','Dubhe','Polaris','Pollux','Procyon','Sirius','Spica','Vega'] ;13 word options                    
  listplanetsandmoons = ['Mercury','Venus','Earth','Mars','Jupiter','Saturn','Uranus','Neptune','Phobos','Deimos','Io','Europa','Callisto','Enceladus','Prometheus','Dione','Titan','Ariel','Oberon','Charon'] ;20 word options                                                                                                                                       
  listgalaxiesandnebulae = ['MilkyWay','Sombrero','Whirpool','Andromeda','Triangulum','Cone','Horsehead','Trifid'] ;8 word options                                                 
  wordlist = [strupcase(liststars), strupcase(listplanetsandmoons), strupcase(listgalaxiesandnebulae)] ;creates an array of above word options, 41 total, user enters -40 to 41 

  playagainchoice = 'Y' 
  while playagainchoice EQ 'Y' DO BEGIN ;begin playing - this will be true until user is asked to play again after they finish once

     userword = chooseword(wordlist) ;call chooseword(pass the list) and return the word that corresponds to user's chosen number
     numberofletters2 = strlen(userword) ;determine length of the word so splitword can 
     splitwordfinal = splitword(userword)

     emptyarray = make_array(numberofletters2, 1, /string, value='_') ;make an underscore array the size of the word to show the user
     print, emptyarray                                                ;print this once at the beginning to show user how many letters their word is
     print, 'You have six incorrect guesses before you are hung. Type any letter (A-Z) to begin playing!' ;prompt user to enter a letter that is then checked in the whileloop

     randomletter = 0           ;assigning some dummy variable to be used for the while loop 
     guesses = 6                ;how many guesses the user is given, will be used later
     playagain = ''

        while randomletter EQ 0 DO BEGIN ;using a while loop to (1) check if input is 1 or more letters (prompts again if >1), (2) checking if the letter is in the chosen word
           favoriteletter = ''  ;empty string that we put something into
           read, favoriteletter ;here is where the user's input goes
           capitalletter = strupcase(favoriteletter)
           letterinput = where(splitwordfinal EQ capitalletter, count) ;count argument makes letterinput the value of how many times the letter input occurs in the lettered array
           if count NE 0 THEN BEGIN                                     ;count becomes its own variable, if it doesn't equal to zero, then the letter exists
              letterexist = 1                                           ;letter exists
           endif ELSE BEGIN
              letterexist = 0   ;letter does not exist
           endelse

           if letterexist EQ 1 THEN BEGIN                       ;refer back to conditional statements just made, here's where we do stuff if the letter exists
              print, 'There exists a(n) "'+capitalletter+'"!'   ;let user feel good about him/herself
              for i=0, numberofletters2 DO BEGIN                ;index from start of word to end of word
                 if splitwordfinal[i] EQ capitalletter THEN BEGIN ;for each letter, if it equals the input letter...
                    emptyarray[i-1] = capitalletter                ;...then replace the underscore with that letter
                 endif
              endfor
           
              for i=0, numberofletters2 DO BEGIN  ;here's where we end the program once the user has completed the word
                 if i EQ numberofletters2 THEN BEGIN ;if the index equals the number of letters, do stuff - this is important because we want the full word to be analyzed at once
                    print, 'You win this time, nerd' ;the user has won the game if this happens
                    randomletter = 1                 ;this breaks the while loop (because the while loop is dependent on randomletter equalling 0)
                 endif ELSE BEGIN
                    if emptyarray[i-1] EQ '_' THEN BREAK ;if the elements in the array equal an underscore, the user has not completed the word,
                 endelse
              endfor
           endif

           print, emptyarray

           if strlen(capitalletter) NE 1 THEN BEGIN ;if the user tries to input more than one letter, don't let them
              print, 'One letter at a time :('      ;this does not use up a guess
           endif ELSE BEGIN
              if letterexist EQ 0 THEN BEGIN ;refer back to conditional statements previously made
                 
                 print, 'WRONG-O, try another letter. You have:',guesses-1,' strikes remaining.' ;this shows the user how many more tries they have before the game is over
                 
                 guesses = guesses-1     ;decrease one guess each time
                 if guesses EQ 0 THEN BEGIN ;here's where the game ends when guesses run out
                    print, 'GAME OVER - your word was:', splitwordfinal
                    randomletter = 1
                 endif
              endif
           endelse
        endwhile
        
        print, 'Play again? Y / N'
        read, playagain
        playagainchoice = strupcase(playagain)
     
     endwhile                                                         
end
