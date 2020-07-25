;iter
(define (cont-frac n d op k)
    (define (iter i result) 
        (if (= i 0) 
            result
            (iter (- i 1) (/ (n i)
                             (op (d i) result)))))
    (iter k 0))


(define (tan-cf x k)
    (define (calc-n i)
        (cond ((= i 1) x)
              (else (square x))))
    (define (calc-d i)
        (- (* 2 i) 1))
    (cont-frac calc-n calc-d - k))
    
(tan-cf 10.0 100)
