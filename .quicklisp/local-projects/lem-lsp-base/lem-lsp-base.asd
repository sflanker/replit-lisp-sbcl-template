(defsystem "lem-lsp-base"
  :depends-on ("cl-change-case" "lem-base")
  :serial t
  :components ((:file "yason-utils")
               (:file "type")
               (:file "protocol-generator")
               (:file "protocol-3-17")
               (:file "converter")
               (:file "utils")))
