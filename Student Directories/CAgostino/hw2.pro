function read_data, filename
	readcol, filename, col1,col2,col3, format = 'A,A,A', delim = ','
	data_arr= make_array(3,n_elements(col1))
	data_arr[0,*] = col1	;first column
	data_arr[1,*] = col2	;second column
	data_arr[2,*] = col3	;third column
	;helya ttfu
	return, data_arr
	;squad
end
function ask_question, third_col_values
	answer_arr= strarr(n_elements(third_col_values))
	for i =0, n_elements(third_col_values)-1 do begin
		nerd = ''
		read, 'Please provide a ' + third_col_values[i] +' ',dummy
		answer_arr[i] = ' ' +dummy
	endfor
	;i thought about 
	save, answer_arr, filename = 'answers.sav' ;helyaaaa
	return, answer_arr
end
function make_sentence, data1, data2, answers
	sentence_arr= strarr(3,n_elements(data1) ;i used data1 since all three columns should have the same number of elements or else it wouldnt make sense as a matrix.
	sentence_arr[1,*] = answers
	sentence_arr[0,*] = data1
	sentence_arr[2,*]= data2
	
	return, sentence_arr
end
pro read_sentences, things
	for i = 0, n_elements(things[0,*])-1 do begin
		print, things[0,i], things[1,i],things[2,i]
	endfor
end
pro thing
	file = 'one.txt'
	data_array = read_data(file)
	answers=ask_question(data_array[2,*])
	sentences = make_sentence(data_array[0,*],data_array[1,*], answers)
	read_sentences, sentences
end
