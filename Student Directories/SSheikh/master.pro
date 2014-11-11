;the master file that puts all of the functions together
@in ;inputs the functions from separate files
@use
@glue
PRO master
   info_arr = in("three.txt")
   answers = use(info_arr)
   glue = glue(info_arr, answers)
print, glue
END
