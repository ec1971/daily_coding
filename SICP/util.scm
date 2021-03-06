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
(define (identity x) x)
(define (compose f g)
    (lambda (x)
        (f (g x))))
(define (repeated f n) 
   (cond ((= n 0) identity) 
         ((even? n) (repeated (compose f f) (/ n 2))) 
         (else (compose f (repeated f (- n 1)))))) 

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
(define (gcd a b)
    (cond ((= b 0) a)
          ((< a b)(gcd b a))
            (else (gcd b (remainder a b)))))
(define (gcd-neg a b)
    (cond ((= b 0) a)
          ((and (< a 0)(< b 0))(gcd (- b) (- a)))
          ((< a b)(gcd b a))
            (else (gcd b (remainder a b)))))