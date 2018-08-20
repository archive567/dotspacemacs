(defconst brittany-packages
  '((brittany :location (recipe :fetcher github :repo "tonyday567/brittany-emacs"))))

(defun brittany/init-brittany ()
  (use-package brittany))

