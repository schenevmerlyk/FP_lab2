(defun group-pairs-and-reverse (lst)
  (let ((result nil))
    (loop for (a b . rest) on lst by #'cddr
          do (setf result (cons (if b (list a b) (list a)) result)))
    result))



(defun check-group-pairs-and-reverse (name input expected)
  "Checks the `group-pairs-and-reverse` function on the given input and expected result."
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (group-pairs-and-reverse input) expected)
          name))

(defun test-group-pairs-and-reverse ()
  (check-group-pairs-and-reverse "test 1" '(a b c d e f) '((E F) (C D) (A B)))
  (check-group-pairs-and-reverse "test 2" '(a b c) '((C) (A B)))
  (check-group-pairs-and-reverse "test 3" nil nil))



(test-group-pairs-and-reverse)