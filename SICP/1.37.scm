;recursive
(define (cont-frac n d k)
    (define (compute i) (if (= i k) 
            (/ (n i)(d i))
            (/ (n i)(+ (d i)(compute (+ i 1))))))
    (compute 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
    11)


;iter
(define (cont-frac n d k)
    (define (iter i result) 
        (if (= i 0) 
            result
            (iter (- i 1) (/ (n i)
                             (+ result (d i))))))
    (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
    11)
