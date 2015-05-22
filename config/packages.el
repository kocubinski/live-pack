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
                processing2-emacs
                ;; colors
                color-theme-zenburn
                monokai-emacs
                color-theme-lush
                ;; javascript
                simple-httpd
                skewer-mode
                tern
                js-comint
                )))

(el-get 'sync my-packages)
