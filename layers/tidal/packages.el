(defconst tidal-packages
  '((tidal :location local)))

(defun tidal/init-tidal ()
  (use-package tidal
    :defer t
    :init
    (progn
      (setq tidal-interpreter "stack")
      (setq tidal-interpreter-arguments (list "ghci" "--ghci-options" "-XOverloadedStrings")))))
