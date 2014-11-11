function colorzoom
  katz=mrdfits('/home/anguyen/ay98/github/Resources/Week8-Images/idl_image.fits', 0, HDR);turn pic to an array
  whats_my_name=whats_my_name()
  if (whats_my_name EQ 3) Then Begin
     kathead=katz(779:1000, 319:690) ;take the head of one cat and call it kathead
     ;display, kathead                ;I want to see the kitty face
     return, kathead                 ;I will need the kitty face for future use
  endif
  if (whats_my_name EQ 1) Then Begin;""
     kathead=katz(539:760, 329:700)
     ;display, kathead
     return, kathead
  endif
  if (whats_my_name EQ 2) then begin;""
     kathead=katz(0:771, 250:621)
     ;display, kathead
     return, kathead
  endif
  if (whats_my_name EQ 0) then begin;""
     kathead=katz(20:241, 250:621)
    ; display, kathead
     return, kathead
     endif
end
function better_half
  kathead=colorzoom();bring back kat head from previous function
  nomakeup=make_array(372, 111, /float, value=1)
  makeup=make_array(372,  111, /float, value=1.333333333333333333333333333333333333333333333)
  mewpowerprism=[[nomakeup], [makeup]];this will lighten the top
  mewprismpower=rotate(mewpowerprism,3);rotate it to put the makeup on the right
  sexykathead=mewprismpower*kathead ;brighten up all the values by 1/3
  display, sexykathead
  return, sexykathead           ;bring it back for later
end
function min_dist
  katz=mrdfits('/home/anguyen/ay98/github/Resources/Week8-Images/idl_image.fits', 0, HDR)
  display, katz
  n=4;# of kitties
  location=strarr(n);create an empty array to fill with locations
  katz=mrdfits('/home/anguyen/ay98/github/Resources/Week8-Images/idl_image.fits', 0, HDR)location(0)=hdr(10);fill them up gradually
  location(1)=hdr(11)
  location(2)=hdr(12)
  location(3)=hdr(13)
  inds = strpos(location, '['); While its still in matrix form I want to find how many characters I have to go before I reach the delimeters starting with [
  inds2 = strpos(location, ',');find how many characters to get to ,
  inds3 = strpos(location, ']');find how many characters to get to ]
  everything=location(0)+location(1)+location(2)+location(3);combine everything into one fat string
  almosteverything=strcompress(everything, /remove_all);the string will be full of spaces after each ] so I want to get rid of all of them
  strkat1x=strmid(almosteverything, inds(0), inds2(0)-inds(0)-1) ; gradually extract the x and y positions of each cat, starting w/ first cat i got her 
                                                                 ;x position
  strkat1y=strmid(almosteverything, inds2(0), inds3(0)-inds2(0)-1); extract the y position of Molly
  strkat2x=strmid(almosteverything, inds3(0)+inds(1), inds2(1)-inds(1)-1);extract the x position of Mary
  strkat2y=strmid(almosteverything, inds3(0)+inds2(1), inds3(1)-inds2(1)-1);extract the y position of Mary
  strkat3x=strmid(almosteverything, inds3(0)+inds3(1)+inds(2), inds2(2)-inds(2)-1); extract the x position of mike
  strkat3y=strmid(almosteverything, inds3(0)+inds3(1)+inds2(2), inds3(2)-inds2(2)-1); extract the y position of mike
  strkat4x=strmid(almosteverything, inds3(0)+inds3(1)+inds3(2)+inds(3), inds2(3)-inds(3)-1);extract the x position of Malakai
  strkat4y=strmid(almosteverything, inds3(0)+inds3(0)+inds3(2)+inds2(3), inds3(3)-inds2(3)-1);extract the y position of Malakai
  strkittycoordinates=[[strkat1x, strkat1y], [strkat2x, strkat2y], [strkat3x, strkat3y], [strkat4x, strkat4y]];now get the positions into a 4x2 array
  kittycoordinates=float(strkittycoordinates);turn it all intofloats so i can do math with them later on
  cursor, x, y;now use picks a point
  click=[[x, y], [x, y], [x, y], [x, y]];put the coordinates of the point into an array, one row for each kitty
  kittymagic=kittycoordinates-click;find the distances in x and y space between the point clicked and the center of each kitty
  distances=[[sqrt(kittymagic[0, 0]^(2)+kittymagic[1, 0]^(2))], [sqrt(kittymagic[0, 1]^(2)+kittymagic[1, 1]^(2))],$
             [sqrt(kittymagic[0, 2]^(2)+kittymagic[1, 2]^(2))], [sqrt(kittymagic[0, 3]^(2)+kittymagic[1, 3]^(2))]] ;use the pythagorean theorem to find the true distances
  min_dist=where(distances EQ min(distances)); now find which kitty has the least distance between him or her and the point clicked and spit out a number that will be translated into a name in the next function 
  return, min_dist
end
function whats_my_name
  katz=mrdfits('/home/anguyen/ay98/github/Resources/Week8-Images/idl_image.fits', 0, HDR);bring back katz
  min_dist=min_dist();bring back the previous function
  kat1=strcompress(hdr(6), /remove_all);take the element of the hdr tat has cat name and get rid of all annoying spaces
  inds1 = strpos(kat1, '=');find where the = is because i care about everything after that
  kat1nom=strmid(kat1, inds1+1);extract the name
  kat2=strcompress(hdr(7), /remove_all) ;i did it again for the other 3 cats
  inds2 = strpos(kat2, '=')
  kat2nom=strmid(kat2, inds2+1)
  kat3=strcompress(hdr(8), /remove_all) 
  inds3 = strpos(kat3, '=')
  kat3nom=strmid(kat3, inds3+1)
  kat4=strcompress(hdr(9), /remove_all) 
  inds4 = strpos(kat4, '=')
  kat4nom=strmid(kat4, inds4+1)
  if (min_dist EQ 0) Then Begin;if the closest kitty was kit1
     print, kat1nom;tell us her name is Molly
  endif
  if (min_dist EQ 1) Then Begin;if closest kitty was kit2
     print, kat2nom;tell us her name is Mary
  endif
  if (min_dist EQ 2) Then Begin;if closest kitty was kit3
     print, kat3nom;tell us his name is Mike
  endif
  if (min_dist EQ 3) Then Begin;if closest kitty was kit4
     print, kat4nom;tell us his name is Malakai
  endif
  return, min_dist
end
function save_kitty
  picture=better_half();get the pic to save
  writefits, 'kitty', picture, "Malakai, when I displayed the image the first time he was the only kitty that didn't look distorted";save the pic
end
pro main
  savekitty=save_kitty();run save kitty, the functions will daisy chain eachother
end
