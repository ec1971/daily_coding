(load "util")

;implementation
;need to fix the sign otherwise gcd would fail
(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))  
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

;use
(define (add x y)
    (make-rat (+ (* (numer x)(denom y))
                 (* (denom x)(numer y)))
              (* (denom x)(denom y))))

(trace make-rat)
(add (make-rat (- 1) 3) (make-rat 2 3))
    