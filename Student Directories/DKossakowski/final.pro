PRO final

filename = "words.txt"
;read in the file 
master_array = FILE_READER(filename)

;choose the random word and store the category number (for future ref)
cat_arr = ["songs", "berkeley", "food", "event", "phrase", "place", "thing", "astronomy"]
random_cat = CHOOSE_RANDOM_COL(master_array)
cat = cat_arr[random_cat]
chosen_word = CHOOSE_RANDOM_WORD(master_array, random_cat)

;print, "chosen_word : " + chosen_word ;;;;;;;;;;;;;;works/tester
;print, cat;;;;;;;;;;;;;;;;;;

;make the word into an array
chosen_word_arr = MAKE_ARRAY(STRLEN(chosen_word), /STRING)
chosen_word_arr = MAKE_WORD_ARRAY(chosen_word, chosen_word_arr)
;print, chosen_word_arr;;;;;;;;;;;;;;works/tester
;make a similar hidden array
hidden_arr = MAKE_HIDDEN_ARRAY(chosen_word_arr)
;print, hidden_arr;;;;;;;;;;;;;;works/tester

;set the amount of wrong guesses to zero 
wrong_guesses = 0 
;just set num_asterisk to a number not equal to 0 in order to start the while loop
num_asterisk = N_ELEMENTS(hidden_arr) 
;game_finished is 1 if NOT finished, game_finished is 0 if finished
game_finished = 1 
;set the total amount of money the user has to 0
money = 0
;set up the wheel
wheel_array = [0,100,200,300,400,500,600,700,800,900,1000,1250,1500,1750,2000,2250,2500,2750,5000]
;ask the user for their name
username = ''
;print out the rules
print, "Welcome to WHEEL OF FORTUNE!!"
READ, "What is your name? ", username
print, "Welcome " + strupcase(username) + "!"
print, "This is how the game works.. The rules are simple"
print, "There are no penalities for guessing the wrong letters"
print, "However, if you think you know the word and guess wrongly, then you are penalized $500, and if you guess wrong THREE times, then the game will end"
print, "As well, a vowel costs $250 to guess."
print, "Alright lets begin,"
print, "Your category is: " + strupcase(cat)
print, "And here is your word!"
print, hidden_arr
print, "Spin that wheel!"

WHILE (num_asterisk NE 0) && (game_finished NE 0) DO BEGIN
    vowel = 1 ;vowel is 1 when the guess is not a vowel, and vowel is 0 if the guess is a vowel
    random_money_value = SPIN_WHEEL(wheel_array)
    WHILE random_money_value EQ 0 DO BEGIN
       print, "Sorry, you landed on Bankrupt! :("
       money = 0
       print, "You now have $" + STRING(money)
       print, "Spin again!"
       random_money_value = SPIN_WHEEL(wheel_array)
    ENDWHILE
    print, "You landed on $" + STRING(random_money_value)
    
    ;ask the user for a guess
    guess=''
    READ, strupcase(username) + ", please guess a letter or number! If you think you got it, type 'got it' ", guess
    guess = strlowcase(guess)
    IF guess EQ 'got it' THEN BEGIN ;lets user tell the game if they think they know what the answer is
       my_answer=''
       READ, 'What is your answer? ', my_answer ;game prompts answer input, gets saved as my_answer
       IF (random_cat EQ 0) THEN BEGIN
          input = strlowcase(my_answer)
       ENDIF ELSE BEGIN
          input = " " +  strlowcase(my_answer) ;turns user answer lowercase so answer isn't case sensitive
       ENDELSE
       IF input EQ chosen_word THEN BEGIN ;if the user answer is right, game says congrats & the game is finished
          print, 'CONGRATULATIONS ' + strupcase(username) + '!!'
          print, "You won $" + STRING(money)
          game_finished = 0
       ENDIF ELSE BEGIN
          IF (input NE chosen_word) && (wrong_guesses NE 2) THEN BEGIN ;if the user answer is incorrect, games says wrong answer, try again, then ends if statements
             print, 'Wrong Answer! Try Again.'
             print, 'You have been penalized $500'
             wrong_guesses+=1
             money = money - 500
             IF (money LT 0) THEN BEGIN
                money = 0
             ENDIF 
          ENDIF ELSE BEGIN
             print, "Sorry! Game Over :("
             game_finished = 0
          ENDELSE
       ENDELSE
    ENDIF

IF game_finished EQ 1 THEN BEGIN
;create a list that will keep track of the indexes of where 
;the guess is found in the chosen word
guess_index_list = MAKE_INDEX_LIST(chosen_word_arr, guess, LIST())

;if the user guesses a correct letter/number then their money goes up
n = guess_index_list.Count()
IF n NE 0 THEN BEGIN
   money += n*random_money_value
ENDIF

IF (guess EQ 'a') || (guess EQ 'e') || (guess EQ 'i') || (guess EQ 'o') || (guess EQ 'u') THEN BEGIN
   money = money - 250
   print, "Since you guessed a vowel, you have been charged $250!"
   IF (money LT 0) THEN BEGIN
      money = 0
   ENDIF 
ENDIF

print, "This is how much money you have right now $" + STRING(money) 

;update the hidden array with the guess given by user
hidden_arr = UPDATE_HIDDEN_ARRAY(guess_index_list, hidden_arr, guess)

;print the hidden array as of now
;if game is finished, there will be a message to end the game
print, PRINT_HIDDEN_ARRAY(game_finished, wrong_guesses, chosen_word, hidden_arr)

;find the number of asterisks left in the hidden array
num_asterisk = ASTERISK(hidden_arr, game_finished)

IF (num_asterisk EQ 0) && (game_finished NE 0) THEN BEGIN
   print, "CONGRATULATIONS " + strupcase(username) + "!!"
   print, "This is how much money you won!! $" + STRING(money)
ENDIF ELSE BEGIN
   print, "Spin Again!"
ENDELSE

ENDIF



ENDWHILE

END

;-------------------FUNCTIONS-----------------------------------
;FILE_READER
;PURPOSE: To read in a file and turn it into an array with the
;           the category columns
;INPUT:   filename -- the file that is being read
;OUTPUT:  master_array -- the array with categories as columns 
FUNCTION FILE_READER, filename
  READCOL, filename, songs, berkeley, food, event, phrase, place, thing, astronomy, DELIMITER = ";", FORMAT = "A, A, A, A, A, A, A, A" ;reads in words.txt, all categories are specified here
   master_array = MAKE_ARRAY(8, n_elements(astronomy), /STRING) ;makes an empty array the size of the category list
   master_array[0,*] = songs  ;fills the empty array with the category columns
   master_array[1,*] = berkeley
   master_array[2,*] = food
   master_array[3,*] = event
   master_array[4,*] = phrase
   master_array[5,*] = place
   master_array[6,*] = thing
   master_array[7,*] = astronomy
   master_array = transpose(master_array) 
   RETURN, master_array
END

;CHOOSE_RANDOM_COL
;PURPOSE: To randomly choose a column from the array
;INPUT:   master_array -- the array with categories as columns
;OUTPUT:  category_number -- the column of the array that is
;           chosen randomly
FUNCTION CHOOSE_RANDOM_COL, master_array
   size = SIZE(master_array)     ;gets the size of master_array

   n = size[2] ;finds the number of categories
   category_number = FIX(n*RANDOMU(Seed)) ;randomly picks a category number
   

   RETURN, category_number
END
;CHOOSE_RANDOM_WORD
;PURPOSE: To randomly choose a word from the array
;INPUT:   master_array -- the array with categories as columns
;         category_number -- the column from the array that will
;           be used
;OUTPUT:  chosen_word -- the randomly chosen word 
FUNCTION CHOOSE_RANDOM_WORD, master_array, category_number
   size = SIZE(master_array)
   chosen_category = master_array[*, category_number] ;makes a new array of words from only that cat   egory
   size_category = SIZE(chosen_category) ;finds the size of chosen_category

   m = size[2] ;finds the number of words in the category
   word_number = FIX(m*RANDOMU(Seed)) ;randomly chooses a word number
   chosen_word = chosen_category[word_number] ;picks the word
   
   RETURN, chosen_word
END

;SPIN_WHEEL
;PURPOSE: To randomly choose a money value 
;         Serves as the money wheel
;INPUT:   wheel_array -- the array with all the money values
;OUTPUT:  chosen_money_value -- the money value that was 
;           randomly chosen from the array 
FUNCTION SPIN_WHEEL, wheel_array
  m = N_ELEMENTS(wheel_array)
  money_num = FIX(m*RANDOMU(Seed)) ;randomly chooses a word number
  chosen_money_value = wheel_array[money_num] ;picks the word
  RETURN, chosen_money_value
END

;MAKE_WORD_ARRAY
;PURPOSE: Turn a string into an array - an array whose each element
;         is a string which is a letter of the given string
;INPUT:   word -- string you want to convert to an array
;OUTPUT:  chosen_word_arr -- the array that the string was converted to 
FUNCTION MAKE_WORD_ARRAY, word, chosen_word_arr
    
    i=0
    WHILE i LT STRLEN(word) DO BEGIN
      chosen_word_arr[i]= STRMID(word,i,1)
      i=i+1
   ENDWHILE
    RETURN, chosen_word_arr
 END

;MAKE_HIDDEN_ARRAY
;PURPOSE: To create an array with the same size as the "string array"
;         filled with just asterisks
;         To serve as the "word to guess"
;         To show the user if there are symbols in the word
;INPUT:   chosen_word_arr -- the array that the string was converted to
;OUTPUT:  hidden_array -- the array that is similar to the inputed array
;         but is just asterisks (*) or symbols
FUNCTION MAKE_HIDDEN_ARRAY, chosen_word_arr
   symbol_array = [" ", "-", "\'", "&", "!", "?", ":"]
   size = N_ELEMENTS(chosen_word_arr)
   hidden_array = MAKE_ARRAY(size, /STRING) ;makes an empty array the length of the word
   j = 0
   WHILE j LT size DO BEGIN ;fills the empty array with asterisks
      symbol_checker = 0
      FOR k = 0, (N_ELEMENTS(symbol_array)-1) DO BEGIN
         IF chosen_word_arr[j] EQ symbol_array[k] && symbol_checker EQ 0 THEN BEGIN
             hidden_array[j] = symbol_array[k]
             symbol_checker = 1
         ENDIF ELSE BEGIN
            IF symbol_checker EQ 0 THEN BEGIN
               hidden_array[j] = "*"
            ENDIF
      ENDELSE
      ENDFOR
      j = j + 1
   ENDWHILE
   RETURN, hidden_array
END

;MAKE_INDEX_LIST
;PURPOSE: To go through the chosen word, and add to a list all
;           of the index(es) of where the guess is found in the
;           word
;         To print out statments of "aw" or "yay"
;INPUT:   chosen_word_arr -- the array that the word was converted to
;         guess -- the user's guess (letter or number)
;         list -- a LIST()
;OUTPUT:  list -- a LIST() that contains all of the index(es) of
;         where the guess is found in the word
FUNCTION MAKE_INDEX_LIST, chosen_word_arr, guess, list
    k=0
    WHILE k LT N_ELEMENTS(chosen_word_arr) DO BEGIN          
       IF (chosen_word_arr[k] EQ guess) THEN BEGIN
          list.Add, k
          ENDIF
          k+=1
       ENDWHILE
    IF list.Count() NE 0 THEN BEGIN
       print, "Nice! Your guess shows up " + STRING(list.Count()) + " time(s)!"
    ENDIF 
    RETURN, list
END

;ASTERISK
;PURPOSE: To return the number of asterisks there still are
;         in the hidden array
;         Serves as the indicator of whether the hidden array
;         has been solved of not
;INPUT:   hidden_arr -- the array that is being searched
;         game_finished -- lets program know if the game is already
;           done or not, (EQ 0 if finished, EQ 1 if NOT finished) 
;OUTPUT:  num_a -- represents how many asterisks (unknowns)
;           are still in the hidden_arr
FUNCTION ASTERISK, hidden_arr, game_finished
  num_a=0                ; set the number of asterisks to zero to start the counter
  n=0
  while (n LT N_ELEMENTS(hidden_arr)) && (game_finished NE 0) DO BEGIN 
     if (hidden_arr[n] EQ '*') THEN BEGIN
        num_a += 1
      endif
     n+=1
  endwhile
  RETURN, num_a
END

;PRINT_HIDDEN_ARRAY
;PURPOSE: To print 3 different things depending on if the game has
;         finished and if the user "got it" too many times
;INPUT:   game_finished -- lets program know if the game is already
;           done or not, (EQ 0 if finished, EQ 1 if NOT finished) 
;         wrong_guesses -- number of guess the user "got it" but 
;           was wrong
;         chosen_word -- the word to guess
;         hidden_arr -- the array that is being searched
;OUTPUT:  String -- if the game is done
;         Array -- the hidden array if game is still going
FUNCTION PRINT_HIDDEN_ARRAY, game_finished, wrong_guesses, chosen_word, hidden_arr
  IF (game_finished EQ 0) && (wrong_guesses NE 2) THEN BEGIN
        RETURN, "That is the correct word: " + STRUPCASE(chosen_word)
  ENDIF ELSE BEGIN
     IF (game_finished EQ 0) && (wrong_guesses EQ 2) THEN BEGIN
        RETURN, "This is the correct word: " + STRUPCASE(chosen_word)
     ENDIF ELSE BEGIN
        print, "Here is your word: "
        RETURN,  hidden_arr
     ENDELSE
  ENDELSE
END

;UPDATE_HIDDEN_ARRAY
;PURPOSE: To print the updated array with the guess from the user
;         Is not called if the user did not guess a correct letter
;         Note: list.IsEmpty() returns 0 if not empty, 
;           and returns 1 if empty
;INPUT:   list -- a LIST() that contains all of the index(es) of
;           where the guess is found in the word
;         hidden_arr -- the array that will be updated if the guess
;           is correct
;         guess -- the user's guess (letter or number)
;OUTPUT:  hidden_arr -- the updated hidden_arr
FUNCTION UPDATE_HIDDEN_ARRAY, list, hidden_arr, guess
  IF (list.IsEmpty() EQ 0) THEN BEGIN
     m=list.Count()
     WHILE  m GT 0  DO BEGIN
         hidden_arr[list.remove()]=guess
         m-=1
     ENDWHILE
  ENDIF
  RETURN, hidden_arr
END
