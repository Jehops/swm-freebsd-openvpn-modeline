;;;; swm-freebsd-openvpn-modeline.asd

(asdf:defsystem #:swm-freebsd-openvpn-modeline
  :description "StumpWM mode-line OpenVPN status for FreeBSD"
  :author "Joseph Mingrone <jrm@ftfl.ca>"
  :license "2-CLAUSE BSD (see COPYRIGHT file for details)"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "swm-freebsd-openvpn-modeline")))

