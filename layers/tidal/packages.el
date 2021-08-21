(defconst tidal-packages
  '((tidal :location local)))

(defun tidal/init-tidal ()
  (use-package tidal
    :init
    (progn
      (setq tidal-interpreter "ghci")
      (setq tidal-interpreter-arguments (list "ghci" "-XOverloadedStrings" "-package" "tidal"))
      (setq tidal-boot-script-path "~/.spacemacs.d/layers/tidal/BootTidal.hs"))))

;; https://github.com/musikinformatik/SuperDirt/blob/develop/superdirt_startup.scd
;; stack ghci --package tidal-1.4.7 --resolver lts-14.13
