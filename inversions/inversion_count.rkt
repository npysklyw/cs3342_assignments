#lang racket

;split function for the code
 (define (count-split-inversions lst1 lst2)
    (cond ((null? lst1) 0)
          ((null? lst2) 0)
          ((< (car lst1) (car lst2))
           (+ (count-split-inversions (cdr lst1) lst2) 0))
          (else
           (+ (length lst1)
              (count-split-inversions lst1 (cdr lst2))))))

;main function
;both utilize recursion
(define (count-inversions lst)
    (cond ((or (null? lst) (null? (cdr lst))) 0)
          (else
           (let* ((mid (quotient (length lst) 2))
                  (lst1 (take lst mid))
                  (lst2 (drop lst mid)))
             (+ (count-inversions lst1)
                (count-inversions lst2)
                (count-split-inversions lst1 lst2))))))

 (count-inversions  `(0))
 (count-inversions  `(1 2 3))
 (count-inversions  `(1 3 2))
 (count-inversions  `(3 2 1))