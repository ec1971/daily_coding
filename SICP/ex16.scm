;recursive
(define (fast-recur b n)
    (define (even? x)
            (= (remainder n 2) 0))
    (cond ((= n 0) 1)
          ((even? n) (square (fast-recur b (/ n 2))))
          (else (* b (fast-recur b (- n 1)))))) 
(fast-recur 1.7 3)

;iter
(define (fast-iter a b n)
    (define (even? x)
            (= (remainder n 2) 0))
    (cond ((= n 0) a)
          ((even? n) (fast-iter a (square b) (/ n 2)))
          (else  (fast-iter (* a b) b (- n 1))))) 
(fast-iter 1 2 10)