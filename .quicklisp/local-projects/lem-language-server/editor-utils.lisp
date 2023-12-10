(in-package :lem-language-server)

(defun backward-up-list (point)
  (lem-base:backward-up-list point t))

(defun forward-up-list (point)
  (lem-base:forward-up-list point t))

(defun forward-down-list (point)
  (lem-base:forward-down-list point t))
