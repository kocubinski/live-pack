;; processing-mode
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

(setq processing-location "C:/dev/apps/processing-2.2.1/processing-java.exe")
(setq processing-application-dir "C:/dev/apps/processing-2.2.1/processing.exe")
(setq processing-sketchbook-dir "C:/Users/mkocubinski/Documents/Processing")

(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet ac-source-words-in-buffer))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary (append processing-functions
                                   processing-builtins
                                   processing-constants)))

(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)

(autoload 'processing-snippets-initialize "processing-snippets" nil nil nil)
(eval-after-load 'yasnippet '(processing-snippets-initialize))

(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary (append processing-functions
                                   processing-builtins
                                   processing-constants)))

(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)
