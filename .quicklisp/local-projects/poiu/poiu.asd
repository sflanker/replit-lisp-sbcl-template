(defsystem "poiu"
  :author ("Daniel Barlow" "Andreas Fuchs" "Francois-Rene Rideau")
  :maintainer "Francois-Rene Rideau"
  :licence "MIT"
  :description "Parallel Operator on Independent Units"
  :long-description "This version of POIU only contains the poiu/fork package"
  :depends-on ((:version "asdf" "3.3.0")
               (:feature (:and :sbcl :os-unix) (:require :sb-posix)))
  :version "1.34.1"
  :components ((:file "fork")))
