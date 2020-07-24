(define (accumulate-filter combiner null-value term a next b pred)
    (if (> a b) 
        null-value
        (combiner 
            (cond ((pred a) (term a))
                  (else null-value))
            (accumulate-filter combiner null-value term (next a) next b pred))))

(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a))) 
    (define (find-div n test) 
       (cond ((> (square test) n) n) ((divides? test n) test) 
             (else (find-div n (+ test 1))))) 
    (find-div n 2)) 
  
(define (prime? n) 
    (if (= n 1) false (= n (smallest-div n)))) 
    
(define (prime-sum a b)
    (define (inc x) (+ x 1))
    (define (identity x) x)
    (accumulate-filter + 0 identity a inc b prime?))
(prime-sum 3 8)

(define (relative-prime-product n)
    (define (gcd a b)
        (cond ((= b 0) a)
              ((< a b)(gcd b a))
              (else (gcd b (remainder a b)))))
    (define (relative-primes? x)
        (= 1 (gcd x n)))
    (define (inc x) (+ x 1))
    (define (identity x) x)
    (accumulate-filter * 1 identity 1 inc n relative-primes?))

(relative-prime-product 10)
