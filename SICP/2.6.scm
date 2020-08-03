; takes in a p1 and return identity
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))
; one = (add-1 zero)
; simplify (add-1 zero) we get one
(define one
    (lambda (f)(lambda (x)(f x))))
; simplify (add-1 one) we get two
; one takes in a p1 and return p that applies x to p1
(define two
    (lambda (f)(lambda (x) (f (f x)))))


