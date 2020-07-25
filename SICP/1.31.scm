(define (product term a next b)
    (if (> a b) 
        1
        (* (term a) 
           (product term (next a) next b))))

(define (product-iter term a next b)
    (define (iter x res)
        (if (> x b)
            res
            (iter (next x) (* res (term x)))))
    (iter a 1))

(define (factorial n)
    (define (inc x) (+ x 1))
    (define (identity x) x)
    (product-iter identity 1 inc n))
    ;(product identity 1 inc n))

(define (pi n)
    (define (inc x) (+ x 1))
    (define (term x) 
        (/(* (* 2.0 x)
             (* 2.0 (inc x)))
          (square (+ 1 (* 2 x)))))
    (* 4 (product term 1 inc n)))
(pi 100)
