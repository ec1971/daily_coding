(define (reverse lst)
    (if (null? lst) 
        lst 
        (append (reverse (cdr lst))(list (car lst)))))
;iterative
(reverse (list (list 1 2) 3 4))
(define (deep-reverse lst)
    (if (null? lst) 
        lst 
        (if (pair? (car lst))
            (append (deep-reverse (cdr lst))(list (deep-reverse (car lst))))
            (append (deep-reverse (cdr lst))(list (car lst))))))

  

(deep-reverse (list (list 1 2) (list 3 4 (list 5 6) )))