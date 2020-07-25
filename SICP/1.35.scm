; original
(define (fix-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? cur next)
        (< (abs (- cur next)) tolerance))
    (define (find-next x)
        (if (close-enough? x (f x))
            (f x)
            (find-next (f x))))
    (find-next first-guess)
)

(define (average x y) (/ (+ x y) 2))
(fix-point cos 1.0)
;(fix-point (lambda (y) (average y (/ 5 y))) 1.0)


; let 
(define (fix-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? cur next)
        (< (abs (- cur next)) tolerance))
    (define (find-next x)
        (let ((next (f x)))
            (if (close-enough? x next)
                next
                (find-next next)))
        )
    (find-next first-guess)
)

; lambda
(define (fix-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? cur next)
        (< (abs (- cur next)) tolerance))
    (define (find-next x)
        ((lambda (next)
            (if (close-enough? x next) 
                next
                (find-next next)))
        (f x)))
    (find-next first-guess)
)

(fix-point cos 1.0)
;golden ratio
(fix-point (lambda (x)(+ 1 (/ 1 x))) 1.0)
