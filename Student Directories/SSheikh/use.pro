;this takes in an array [words, punctuation, parts of speech] and
;returns an array of user responses to prompts for parts-of-speech

FUNCTION use, info_arr 
   t_array = transpose(info_arr) ;gets the array into a usable form
   prompt_arr = t_array[2,*] 
   n = SIZE(prompt_arr, /N_ELEMENTS)
   answers = MAKE_ARRAY(n, /STRING, VALUE = '') ;makes an empty array to fill with answers
   response = ''
   FOR i = 0, (n - 1) DO BEGIN ;gets user responses
      READ, "Please provide a" + prompt_arr[i] + ' ', response
      answers[i] = response
   ENDFOR
   SAVE, answers, filename = 'answers.sav' ;saves user responses
   RETURN, answers
END
