;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "packages.el")
(live-load-config-file "bindings.el")
(live-load-config-file "processing.el")
(live-load-config-file "display.el")
(live-load-config-file "javascript.el")
(live-load-config-file "clojure.el")

(evil-mode 1)
