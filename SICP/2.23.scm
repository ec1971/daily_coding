(define (for-each proc items)
   (map proc items) #t)
(for-each (lambda(x) (newline) (display x)) (list 1 2 3))

   
  