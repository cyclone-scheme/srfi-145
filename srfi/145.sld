(define-library (srfi 145)
  (export assume)
  (import (scheme base))
  (begin
    (define-syntax assume
      (syntax-rules ()
        ((assume expression message ...)
         (unless expression
           (error "invalid assumption" (quote expression) (list message ...))))
        ((assume . _)
         (syntax-error "invalid assume syntax"))))))
