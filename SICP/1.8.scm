;use the good-enough test in ex7 and the below function to improve
(define (improve guess x)
  (/ (+ (/ x (sqaure guess))
        (* 2 guess)) 
     3))
