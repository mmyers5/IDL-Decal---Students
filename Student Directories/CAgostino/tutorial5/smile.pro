pro smile
	;psopen, 'smile.ps',/inches, xsize=5, ysize=5, /color, /ps_fonts 
	
	x= findgen(101)/10
	plot,x, sqrt(25.-(findgen(110)/10-5.)^2.)+5,thick=2,TITLE = 'Helya', XTITLE='lmao', YTITLE='ayyy',;top of da face
	oplot,x,-sqrt(25. - (findgen(110)/10-5.)^2.)+5.,thick=2; bottom of da face

	oplot,x,sqrt(.25 -(x-3)^2.)+6.,thick=2, color="FF0000"x;left eye
	oplot,x,-sqrt(.25 -(x-3)^2.)+6.,thick=2,color="FF0000"x;left eye

	oplot,x,(.25 - (x-7.)^2.)^(1./2.)+6.,thick=2, color="FF0000"x;right eye
	oplot, x,-(.25 - (x-7.)^2.)^(1./2.)+6.,thick=2,color="FF0000"x;right eye

	oplot, x,-(16-(x-5)^2)^(1./2.)+5,thick=2, color= COLOR24(255,0,0); smile :)

	;psclose this didn't work so nah
end

