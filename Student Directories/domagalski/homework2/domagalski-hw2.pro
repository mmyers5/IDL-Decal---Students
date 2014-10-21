function read_file, filename
    ; Read in all of the input data from a text file.
    readcol, filename, col0, col1, col2, format = 'A,A,A', delimiter = ','

    ; Return a 3 x N array of the strings.
    return, transpose([[col0], [col1], [col2]])
end

function read_user, column, filename
    ; This function asks the user for input as asked in column.

    n_cols = n_elements(column)
    answers = strarr(n_cols)

    ; Loop over all elements in the column
    for i = 0, n_cols-1 do begin
        input = ''
        read, 'Please provide a' + column[i] + ': ', input
        answers[i] = input
    endfor

    ; Save the answers as text and return the data.
    outfile  = 'output-' + repstr(filename, '.txt', '-')
    outfile += string(systime(/julian), format='(f0.6)') + '.txt'
    openw, 1, outfile
    writeu, 1, answers + string(10b)
    close, 1
    return, answers
end

function mix_n_mash, fst_col, answers, snd_col
    ; 3 x N array that gets mixed and mashed.
    return, [fst_col, transpose(answers), snd_col]
end

pro print_output, output
    ; This procedure prints the output of the madlib
    for i = 0, n_elements(output) / 3 - 1 do begin
        out0 = repstr(output[0, i], ';', '')
        out1 = repstr(output[1, i], ';', '')
        out2 = repstr(output[2, i], ';', '')
        print, out0, ' ', out1,  out2
    endfor
end

pro main, filename
    ; This main function does 4 things, first reads in txt, then asks users for
    ; stuff, then mixes and mashes the output, then prints it.
    columns = read_file(filename)
    answers = read_user(columns[2,*], filename)
    print_output, mix_n_mash(columns[0,*], answers, columns[1,*])
end
