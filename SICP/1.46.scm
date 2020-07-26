(define (iterative-improve good-enough? improve)
    (lambda (init-guess)
        (define (try guess)
            (if (good-enough? guess) 
                guess 
                (try (improve guess))))
        (try init-guess)))

