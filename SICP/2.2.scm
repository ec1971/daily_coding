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
(define (make-segment p1 p2)())
(define (start-segment seg)())
(define (end-segment seg)())

; point implementation
(define (make-point x y)())
(define (x-point p)())
(define (y-point p)())

; takes in segment and return midpoint
(define (midpoint-segment seg)())

(print-point 
    (midpoint-segment 
        (make-segment (make-point -1 5)
                      (make-point 2 3))))