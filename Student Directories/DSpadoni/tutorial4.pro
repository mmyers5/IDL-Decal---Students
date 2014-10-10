;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week
     
     ;please avoid simply printing clues to
     ;get an idea of what the strings 
     ;look like. The idea is to work with the
     ;functions within idl.

     ;FOLLOW THE FOLLOWING INSTRUCTIONS AND CONCATENATE THE RESULTS OF EACH INTO AN ARRAY
     
     ;1. extract the first letter of the first string in clues and make it
     ;   lowercase (use strlowcase)
     newclues1 = strlowcase(strmid(clues(0),0,1))
     print, newclues1
     ;2. find the string containing the substring 'og' and extract it from that string
     print, strpos(clues, 'og')                ;;Here, from compiling in idl, we see the -1 values that are printed are where there is no                                                  'og' substring. However, we see that our search is satisfied at the 4th index, and the '0'                                                 that is printed shows us what entry 'og' starts at.
     newclues2 = strmid(clues(4),0,2)          ;;Here we're extracting the 2 characters 'og' from the 4th index spot in clues and printing
     ;3. add in an '_'
     ;4. find the string containing 'ate' and extract 3 letters from the p on
     print, strpos(clues, 'ate')               ;;Running this, we find the 19th entry in clues contains 'ate'
     print, strpos(clues(19), 'p')             ;;And running this, we find 'p' in the 5th entry where we previously found 'ate'
     newclues3 = strmid(clues(19),5,3)         ;;Extracting the 3 letters starting from 'p' and printing
     print, newclues3
     ;5. find the string containing 'x' and extract the first two letters
     print, strpos(clues, 'x')                 ;;We see that there are two entries - namely the 5th and 22nd - in 'clues' which contain 'x'                                                 in its 1st index
     newclues4 = strmid(clues(5),0,2)          ;;Extracting the first two letters from 5th and 22nd entries and printing - both are 'ax'
     ;newclues5 = strmid(clues(22),0,2)        ;;Only using one 'ax'?
     print, newclues4

     theclues = [newclues1, newclues2 + '_',  newclues3, newclues4] ;;Concatenating into one array'
     print, theclues
     ;6. use strjoin to collape your array into a single string
     strtheclues = strjoin(theclues)
     ;7. use repstr to replace the second o in your string with ''
     splitclues = strsplit(strtheclues, '_', /EXTRACT)        ;;From the '_', we split the string of all the clues into two parts
     arrayofsplit = [splitclues]                              ;;And placing them into an array to be joined again later
     replaceo = repstr(arrayofsplit(1), 'o', '')              ;;Removing the 'o' in the second element of our array
     togetheragain = arrayofsplit(0) + '_' + replaceo         ;;Combining the new elements again to be joined into a string
     finalclues = strjoin(togetheragain)
     ;   (try using the /reverse_search option in strpos)      
     ;8. add in a '.pro'
     lastlast = finalclues + '.pro'                           ;;Adding '.pro' and printing
     print, lastlast
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs

     ;;OUTPUT: log_prax.pro


end
