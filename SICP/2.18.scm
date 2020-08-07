(define (append lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1) (append (cdr lst1) lst2))))
;recursive - using append(less efficient)
(define (reverse lst)
    (if (null? lst) 
        lst 
        (append (reverse (cdr lst))(list (car lst)))))
;iterative
(reverse (list 1 2 3 4))