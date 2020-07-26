(load "util")
(define (repeated f n) 
    (lambda (x)
    (cond ((= n 1)(f x))
          ((even? n)((repeated (compose f f) (/ n 2)) x))
          (else ((repeated f (- n 1))(f x)))))) 
((repeated square 2) 5)
        