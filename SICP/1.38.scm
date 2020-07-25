;iter
(define (cont-frac n d k)
    (define (iter i result) 
        (if (= i 0) 
            result
            (iter (- i 1) (/ (n i)
                             (+ result (d i))))))
    (iter k 0))

(define (calc-d i)
    (cond ((= (remainder i 3) 2)(* 2 (/(+ i 1)3)))
          (else 1)))

( + 2 (cont-frac (lambda (i) 1.0) calc-d 100))

