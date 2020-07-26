(load "util")
(define (smooth f)
    (define dx 0.00001)
    (lambda (x)
        (/ (+ (f x)
              (f (- x dx))
              (f (+ x dx))) 
           3)))

((smooth square) 5)
(define (n-fold-smooth f n)
    ((repeated smooth n) f))

((n-fold-smooth square 10) 5)