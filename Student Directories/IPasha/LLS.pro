pro main

readcol,'data.dat', x, y, format='F,F'

ma = [[total(x^2),total(x)],[total(x),400]]
mc = [[total(x*y)],[total(y)]]
mai = invert(ma)
md = mai ## mc
mfit = md[0,0]
cfit = md[0,1]
psopen, 'LLS.ps'
plot, x, y, psym=1, title='LLS Graph',xtitle='X values',ytitle='Y values'
oplot, x, mfit*x+cfit
psclose
end






