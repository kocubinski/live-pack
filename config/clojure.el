(defun change-namespace ()
  (interactive)
  (let ((orig (point)))
    (goto-char (point-min))
    (lisp-eval-defun)
    (goto-char orig)))

(add-hook 'clojure-mode-hook
          (lambda ()
            (define-key clojure-mode-map (kbd "C-c C-n") 'change-namespace)))
