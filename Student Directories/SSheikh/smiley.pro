PRO smile
  ;makes the face
  face_array = findgen(101)/16
  x_circle_face = sin(face_array)
  y_circle_face = cos(face_array)
  PLOT, x_circle_face, y_circle_face, title = 'smile!', color = 100

  ;makes the eyes
  eye_array = findgen(101)/16
  x_eye = sin(eye_array)/6
  y_eye = cos(eye_array)/6
  eye_right_x = x_eye + 0.3
  eye_right_y = y_eye + 0.25
  eye_left_x = x_eye - 0.3
  eye_left_y = y_eye + 0.25
  OPLOT, eye_right_x, eye_right_y
  OPLOT, eye_left_x, eye_left_y

  ;makes the smile
  smile_array = findgen(51)/16
  x_coord_smile = sin(smile_array+1.5)
  y_coord_smile = cos(smile_array+1.5)
  x_smile = x_coord_smile/2
  y_smile = y_coord_smile/2 - 0.3
  OPLOT, x_smile, y_smile
END
