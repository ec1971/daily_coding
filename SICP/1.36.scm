; lambda
(define (fix-point f first-guess)
    (define (report x step)
        (display "Step ")
        (display step)
        (display ": ")
        (display x)
        (newline))
    (define tolerance 0.00001)
    (define (close-enough? cur next)
        (< (abs (- cur next)) tolerance))
    (define (find-next x step)
        ((lambda (next)
            (report x step)
            (if (close-enough? x next) 
                next
                (find-next next (+ step 1))))
        (f x)))
    (find-next first-guess 1)
)

(define (average x y) (/ (+ x y) 2))
(fix-point (lambda (x)(/ (log 1000) (log x))) 2.0)
(newline)
(fix-point (lambda (x)(average x (/ (log 1000) (log x)))) 2.0)
