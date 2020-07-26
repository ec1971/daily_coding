;usage (load "util")
(define (average-damp f)
    (define (average a b)(/ (+ a b) 2))
    (lambda (x)(average x (f x))))

(define (average x y) (/ (+ x y) 2))

(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a))) 
    (define (find-div n test) 
       (cond ((> (square test) n) n) ((divides? test n) test) 
             (else (find-div n (+ test 1))))) 
    (find-div n 2)) 
  
(define (prime? n) 
    (if (= n 1) false (= n (smallest-div n)))) 

(define (even? x) (= (remainder x 2) 0))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (compose f g)
    (lambda (x)
        (f (g x))))

