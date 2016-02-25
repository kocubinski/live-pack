;; this function removed from org-mode after emacs >= 24.4
(require 'org-macs)
(defun org-define-error (name message)
  "Define NAME as a new error signal.
MESSAGE is a string that will be output to the echo area if such
an error is signaled without being caught by a `condition-case'.
Implements `define-error' for older emacsen."
  (if (fboundp 'define-error) (define-error name message)
    (put name 'error-conditions
	 (copy-sequence (cons name (get 'error 'error-conditions))))))

(setq org2blog/wp-blog-alist
      '(("wordpress"
         :url "https://kocubinski.wordpress.com/xmlrpc.php"
         :username "kocubinski"
         :default-title "Yet Another Post")))
