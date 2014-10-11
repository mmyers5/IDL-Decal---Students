### Chapter 2

* Largest number: 32767
* Smallest number: -32768
* Rest mass energy of an electron: 8.19e-14

### Chapter 3

```
IDL> x = findgen(8) 
IDL> y = x + 5 
IDL> print, x 
      0.00000      1.00000      2.00000      3.00000      4.00000      5.00000      6.00000      7.00000
IDL> print, y 
      5.00000      6.00000      7.00000      8.00000      9.00000      10.0000      11.0000      12.0000
IDL> plot, x, y 
libGL error: failed to load driver: i965
libGL error: Try again with LIBGL_DEBUG=verbose for more details.
IDL> print, fltarr(8) 
      0.00000      0.00000      0.00000      0.00000      0.00000      0.00000      0.00000      0.00000
IDL> print, fltarr(8) + 7 
      7.00000      7.00000      7.00000      7.00000      7.00000      7.00000      7.00000      7.00000
IDL> z = fltarr(8) + 7    
IDL> oplot, x, y 
```
