(define (accumulate combiner null-value term a next b)
    (if (> a b) 
        null-value
        (combiner 
            (term a)
            (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
    (define (iter x res)
        (if (> x b)
            res
            (iter (next x) (combiner res (term x)))))
    (iter a null-value))

(define (factorial n)
    (define (inc x) (+ x 1))
    (define (identity x) x)
    (accumulate-iter * 1 identity 1 inc n))
(factorial 5)
