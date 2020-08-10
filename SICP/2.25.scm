(define l (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr l)))))

(define l1 (list (list 7)))
(car (car l1))

(define l2 (list 1 (list 2 (list 3 4))))
;(cdr l2)