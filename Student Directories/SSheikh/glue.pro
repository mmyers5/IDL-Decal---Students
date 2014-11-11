;takes the words and punctuation and puts them together with the user responses

FUNCTION glue, info_arr, answers
   t_answers = transpose(answers) ;gets answers in a usable form
   array = transpose(info_arr)
   words = array[0,*] ;makes a word array
   punct = array[1,*] ;makes a punctuation array
   n = size(words, /N_ELEMENTS)
   madlibs = MAKE_ARRAY(n, 1, /STRING, VALUE = '')
   FOR i = 0, (n-1) DO BEGIN ;put the first phrase with the first user-word with the first punctuation mark and adds it to the madlibs array
      madlibs[i] = words[i] + ' ' + t_answers[i] + punct[i]
   ENDFOR
   RETURN, madlibs
END
