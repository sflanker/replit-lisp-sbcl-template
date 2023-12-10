;; (ql:register-local-projects)
;; (ql:quickload "poiu")
;; (require "poiu")
;; 
;; (write-line "Shall we begin?")
;; 
;; (let ((fpid (poiu/fork:posix-fork)))
;;   (cond
;;     ((< fpid 0) (write-line "Unable to fork!"))
;;     ((= fpid 0) (write-line "Hello, World!"))
;;     (t (write-line (format nil "I'm a parent! ~D" fpid)))))
;; 
(defun foo (arg)
  (write-line arg))


(foo "asdf")