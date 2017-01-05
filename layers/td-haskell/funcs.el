(defun td-haskell-add-hlint ()
  (interactive)
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))
