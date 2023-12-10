(ql:quickload "lem-language-server" :silent t)
(ql:quickload "poiu" :silent t)
(ql:quickload "trivial-signal" :silent t)

(require "trivial-signal")
(require "lem-language-server")
(require "log4cl")
(require "poiu")

(defun exit-on-signal (signo)
  (format *error-output* "~&received ~A~%" (trivial-signal:signal-name signo))
  (sb-ext:exit :code 1 :abort t))
(setf (trivial-signal:signal-handler :term) #'exit-on-signal)

(defvar *micros-port* 4005)

(let ((fpid (poiu/fork:posix-fork)))
  (cond
    ((< fpid 0)
     (error
       'create-process-error
       :message "The call to posix-fork returned an error code"))
    ((= fpid 0)
     (progn
       (log:config :sane :daily "~/lsp-backend.log" :debug)
       (log:debug "Running micros create-server on port ~D" *micros-port*)
       (micros:create-server :dont-close t :port *micros-port*)
       (loop (sleep 3))))
    (t
     (progn
       (log:config :sane :daily "~/lsp-frontend.log" :debug)
       (log:debug "Micros server launched: ~D" fpid)
       (setf (lem-language-server:config :backend-port) *micros-port*)
       (lem-language-server:start-stdio-server)
       ))))


