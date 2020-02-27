(define-library (srfi 145)
  (export assume)
  (import (scheme base))
  (begin
    (define-syntax assume
      (syntax-rules ()
        ((assume expression message ...)
         (unless expression
           (fatal-error "invalid assumption" (quote expression) (list message ...))))
        ((assume . _)
         (syntax-error "invalid assume syntax"))))
  (cond-expand
    (debug
     (begin
       (define fatal-error error)))
    (else
     (begin
       (define (fatal-error message . objs)
         (car 0)))))))
