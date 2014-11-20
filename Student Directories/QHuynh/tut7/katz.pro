function colorzoom, image
  picture = mrdfits(image, 0, header)
  display, picture  ;;loads in picture and displays for user
  device, decomposed = 0
  loadct, 13 
  zoom, /KEEP, xsize = 400, ysize = 400
end

