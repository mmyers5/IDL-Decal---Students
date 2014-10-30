function colorzoom
  katz=mrdfits('/home/anguyen/ay98/github/Resources/Week8-Images/idl_image.fits', 0, HDR)
  kathead=make_array(200, 300, /integer, value=0)
  kathead=katz(700:900, 300:600)
  return kathead
end
