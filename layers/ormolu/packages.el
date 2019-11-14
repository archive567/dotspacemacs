(defconst ormolu-packages
  '((ormolu :location (recipe :fetcher github :repo "tonyday567/ormolu.el"))))

(defun ormolu/init-ormolu ()
  (use-package ormolu))

