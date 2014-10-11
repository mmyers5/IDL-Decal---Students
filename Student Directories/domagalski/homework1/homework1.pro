pro swap_em, x, y
    ;;; This function swaps two numeric variables without using a tmp variable.
    print, "x = ", x, ", y = ", y
    x = x + y
    y = x - y
    x = x - y
    print, "x = ", x, ", y = ", y
end

function nth_root, base, root
    ;;; This function returns the nth root of some number
    if base le 0 then begin
        return, 0
    endif else begin
        return, base^(1.0/root)
    endelse
end

function fact, n
    ;;; Recursively computes a factorial
    if n le 1 then begin
        line1 = 'yo momma so fat that the recursive function '
        line2 = 'computing her mass causes a stack overflow!'
        print, line1 + line2
        return, 1
    endif else begin
        return, n * fact(n-1)
    endelse
end

pro prob4_for, x, y
    ;;; Problem 4 of homework 1
    if y le x then begin
        print, 'check your inputs'
    endif else begin
        for i=x, y do begin
            print, nth_root(i, 2)
        endfor
    endelse
end

pro prob4_while, x, y
    ;;; Problem 4 of homework 1
    if y le x then begin
        print, 'check your inputs'
    endif else begin
        while x le y do begin
            print, nth_root(x, 2)
            x += 1
        endwhile
    endelse
end
