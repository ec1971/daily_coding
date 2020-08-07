(define (append lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1) (append (cdr lst1) lst2))))

(define (same-parity first . remaining)
    (define target first)
    (define numbers (append (list first) remaining))
    (define (check tgt nums)
        (if (null? nums)
            nums
            (append (car nums)(check tgt (cdr nums)))))
    (if (null? remaining)
        first
        (display "ok")))
        (check target numbers))

(same-parity 1)
