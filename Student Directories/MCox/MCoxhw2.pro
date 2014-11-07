function single
filename = 'one.txt'
;Sets the text 'one.txt' as the variable 'filename'
   
   readcol, filename, col1, col2, col3, format = 'A,A,A', delim = ','
;Reads the file data with three columns into three variables of arrays.

  mat1=[[col1],[col2],[col3]]
;Combines the read values and indiviulaly fills the array.

return, mat1
;Returns the array full of the values of the file data.

end


function once, x

mat1 = x[*,2]
values = strarr(32)
;This sets the variables for completing a for loop in order to get answers.

for i = 0, (n_elements(x[*,2]) - 1) do begin
    pylons = ''
    read, "I command you to give me a(n) " +  mat1[i] + ' ', pylons
    values[i]= pylons
endfor
;This will ask the questioner to provide an answer to each completed question.
save, values, filename = 'mat2.sav'
return, values
;This will return my array filled with the values from the file data.

end

function uno, x, y

  col1 = x[*,0]
  col2 = y
  col3 = x[*,1]
;This sets the colomns within the two matricies as individual variables.

  mat2 = [[col1],[col2],[col3]]
;This creates a new matrix with the first data colomn as the first
;colomn, the second data colomn as the third colomn, and the answers as
;the second colomn.
return, mat2
end

function une, z

c1 = z[*,0]
c2 = z[*,1]
c3 = z[*,2]
for i = 0, (n_elements(z[*,0]) - 1) do begin
ele1 = c1[i]
ele2 = c2[i]
ele3 = c3[i]
print, ele1 + ' ' + ele2 + ele3
endfor
;This will create a loop to organize the entire matrix into IDL.
end

pro one
x = single()
y = once(x)
z = uno(x,y)
q = une(z)
end
