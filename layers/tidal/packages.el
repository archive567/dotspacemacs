(defconst tidal-packages
  '((tidal :location local)))

(defun tidal/init-tidal ()
  (use-package tidal
    :init
    (progn
      (setq tidal-interpreter "stack")
      (setq tidal-interpreter-arguments (list "ghci" "--ghci-options" "-XOverloadedStrings" "--package" "tidal-1.4.7" "--resolver" "lts-14.13"))
      (setq tidal-boot-script-path "~/.spacemacs.d/layers/tidal/BootTidal.hs"))))


;; stack ghci --package tidal-1.4.7 --resolver lts-14.13
