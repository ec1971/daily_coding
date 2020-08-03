; public interface
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

; segment implementation
;takes in two points
(define (make-segment p1 p2)
    (cons p1 p2))
(define (start-segment seg)(car seg))
(define (end-segment seg)(cdr seg))

; point implementation
(define (make-point x y)
    (cons x y ))
(define (x-point p)(car p))
(define (y-point p)(cdr p))

; takes in segment and return midpoint
(define (midpoint-segment seg)
    (define (mid-pos x y)
        (/ (+ x y) 2))
    (make-point 
        (mid-pos (car (start-segment seg))
                 (car (end-segment seg)))
        (mid-pos (cdr (start-segment seg))
                 (cdr (end-segment seg)))))

(print-point 
    (midpoint-segment 
        (make-segment (make-point -1.0 5.0)
                      (make-point 2.0 3.0))))