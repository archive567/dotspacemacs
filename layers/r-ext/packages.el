(defconst r-ext-packages
  '())

(defun ess/post-init-ess ()
  (add-hook 'R-mode-hook 'flycheck-mode)
  (add-hook 'ess-mode-hook
            (lambda()
              (setq mode-name "r!")))
  (bind-key* "M-n" 'flycheck-next-error)
  (bind-key* "M-p" 'flycheck-previous-error))
