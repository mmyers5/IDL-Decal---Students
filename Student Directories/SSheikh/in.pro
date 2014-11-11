;this function takes in the data file and saves it into an array of
;words, punctuation, and parts of speech

FUNCTION in, filename
   READCOL, filename, col1, col2, col3, delimiter = ',', format = 'A,A,A'
   info_arr = [[col1], [col2], [col3]]
   RETURN, info_arr
END
