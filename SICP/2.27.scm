(define (reverse lst)
    (if (null? lst) 
        lst 
        (append (reverse (cdr lst))(list (car lst)))))
;iterative
(reverse (list (list 1 2) 3 4))
(define (deep-reverse lst)
    (if (null? lst) 
        lst 
        (append (reverse (cdr lst))(list (reverse (car lst))))))

(deep-reverse (list (list 1 2) 3 4))