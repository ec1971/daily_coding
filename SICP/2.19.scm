(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define (no-more? coins)(null? coins))
;return a list
(define (except-first-coins coins)(cdr coins))
;return a value
(define (first-value coins)(car coins))
(define (cc amount coin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0)(no-more? coin-values)) 0)
          (else 
            (+ (cc amount (except-first-coins coin-values))
               (cc (- amount (first-value coin-values)) coin-values)))))

(cc 100 us-coins)