
(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (factor k)
        (cond ((or (= 0 k)(= n k)) 1)
              ((even? k) 2)
              (else 4)))
    (define (term k)
        (* (factor k)(f (+ a (* k h)))))
    (*(/ h 3) (sum term 0 inc n)))

;utils
(define (even? x) (= (remainder x 2) 0))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

;sum
(define (sum term a next b) 
   (if (> a b) 
       0 
       (+ (term a) 
          (sum term (next a) next b)))) 
;test

(simpson cube 0 1.0 100)
(simpson cube 0 1.0 1000)
