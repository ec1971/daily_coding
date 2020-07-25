(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m ))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (test-all n) 
   (define (calculate a n) 
     (if (= a n) true 
         (if (= (expmod a n n) a) (calculate (+ a 1) n) false))) 
   (calculate 1 n)) 

(define (print-primes start end)
    (cond 
        ((>= end start)
            (if (test-all start) 
                (begin 
                    (display start) 
                    (newline)))
            (print-primes (+ start 1) end))
        (else (display "done"))))

(print-primes 2 30)