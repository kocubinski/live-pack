;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

;; install el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path (concat (live-pack-lib-dir) "recipes"))

(setq my-packages
      (append '(evil
                processing2-emacs)))

(el-get 'sync my-packages)

(evil-mode 1)

(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

(setq processing-location "C:/binski/apps/processing-2.2.1/processing-java.exe")
(setq processing-application-dir "C:/binski/apps/processing-2.2.1/processing.exe")
(setq processing-sketchbook-dir "C:/Users/Matt/Documents/Processing")

;; display
(set-face-attribute 'default nil :font "Consolas-11")
