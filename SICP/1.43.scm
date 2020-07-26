(load "util")
;original
(define (repeated f n) 
    (lambda (x)
    (cond ((= n 1)(f x))
          ((even? n)((repeated (compose f f) (/ n 2)) x))
          (else ((repeated f (- n 1))(f x)))))) 

;cleaned up version
(define (repeated f n) 
   (cond ((= n 0) identity) 
         ((even? n) (repeated (compose f f) (/ n 2))) 
         (else (compose f (repeated f (- n 1)))))) 
((repeated square 2) 5)
        