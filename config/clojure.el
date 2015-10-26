(defun change-namespace ()
  (interactive)
  (let ((orig (point)))
    (goto-char (point-min))
    (lisp-eval-defun)
    (goto-char orig)))

(add-hook 'clojure-mode-hook
          (lambda ()
            (define-key clojure-mode-map (kbd "C-c C-n") 'change-namespace)))

(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(defun lisp-bindings ()
  (interactive)
  (local-set-key (kbd "C-M-x") 'lisp-eval-defun)
  (local-set-key (kbd "C-c C-r") 'lisp-eval-region))
