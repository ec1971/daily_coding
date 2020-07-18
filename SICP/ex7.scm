(define (good-enough? guess x)
  (< (abs (-(improve guess x) guess)) 0.001))
