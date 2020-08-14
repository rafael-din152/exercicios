#lang racket

(provide (all-defined-out)) ; so we can put tests in a second file

; put your code below

; Problem 1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

;Problem 2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append suffix x)) xs))

;Problem 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [(car (list-tail xs (remainder (length xs) n)))]))

;Problem 4
(define (stream-for-n-steps s n)
  (if (zero? n)
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

;Problem 5
(define (negative-5-multiple x)
  (if (zero? (remainder x 5))
      (* x -1)
      x))

(define funny-number-stream
  (letrec ([f (lambda (x) (cons (negative-5-multiple x) (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

;Problem 6
(define dan-then-dog
  (letrec ([dan (lambda () (cons "dan.jpg" dog))]
           [dog (lambda () (cons "dog.jpg" dan))])
    (lambda () (dan))))
