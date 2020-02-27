(import (cyclone test)
        (scheme base)
        (srfi 145))

(test-group "True Assumption"
  (test #f (assume #t "True statement")))

(test-group "False Assumption"
  (with-handler
    (lambda (err)
      (test '("invalid assumption" #f ("test")) err))
    (assume #f "test")))

(test-exit)
