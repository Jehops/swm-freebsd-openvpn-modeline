;; swm-freebsd-openvpn-modeline.lisp
;;
;; Put %V in your mode-line format string to get the status of OpenVPN.
;;

(in-package #:swm-freebsd-openvpn-modeline)

(defvar *openvpn-status* nil)
(defvar *openvpn-stream* nil)

(defun set-openvpn-stream ()
  (setf *openvpn-stream*
	(sb-ext:process-output
	 (sb-ext:run-program "ml_openvpn.sh" nil
			     :output :stream
			     :search t
			     :wait nil))))

(defun fmt-freebsd-openvpn-status (ml)
  "Return the status of OpenVPN."
  (declare (ignore ml))
  (when (not *openvpn-stream*)
    (set-openvpn-stream))
  (when (listen *openvpn-stream*)
    (setf *openvpn-status* (read-line *openvpn-stream* nil "")))
  (format nil "~1a" *openvpn-status*))

;; Install formatter
(stumpwm::add-screen-mode-line-formatter #\V #'fmt-freebsd-openvpn-status)
