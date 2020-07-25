;iter
(define (f-iter a b c n)
        (cond ((= n 0) c)
              (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
(f-iter 2 1 0 5)


;recursive
(define (f-recursive n)
        (cond ((< n 3) n)
              (else (+ (f-recursive(- n 1))
                       (* 2 (f-recursive(- n 2)))
                       (* 3 (f-recursive(- n 3)))))))
(f-recursive 5)