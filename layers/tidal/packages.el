(defconst tidal-packages
  '((tidal :location (recipe :fetcher github :repo "tonyday567/Tidal"))))

(defun tidal/init-tidal ()
  (use-package tidal
    :defer t
    :init
    (progn
      (setenv "TIDAL_TEMPO_PORT" "9160")
      (setq tidal-interpreter "stack")
      (setq tidal-interpreter-arguments (list "ghci" "--with-ghc=intero")))))
