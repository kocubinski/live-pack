(require 'tern)
(require 'skewer-mode)
(require 'skewer-repl)

(defun js2-mode-setup ()
  ;; (add-hook 'js2-mode-hook
  ;;           (lambda ()
  ;;             (setq js2-basic-offset 2)))
  ;;(setq js2-bounce-indent-p t)
  (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(defun tern-setup ()
  (when (el-get-package-installed-p 'js2-mode)
    (add-hook 'js2-mode-hook (lambda () (tern-mode t))))
  (when (el-get-package-installed-p 'js3-mode)
    (add-hook 'js3-mode-hook (lambda () (tern-mode t))))
  (setq tern-command (cons (executable-find "tern") '()))
  (eval-after-load 'tern
    '(progn
       (require 'tern-auto-complete)
       (tern-ac-setup))))

(defun skewer-mode-setup ()
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode))

(setq inferior-js-program-command "node --interactive")

(defun init-js-comint ()
  (interactive)
  (skewer-mode 0)
  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
  (local-set-key "\C-cb" 'js-send-buffer)
  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
  (local-set-key "\C-cl" 'js-load-file-and-go))


(js2-mode-setup)
(tern-setup)
(skewer-mode-setup)
