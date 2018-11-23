(defconst r-ext-packages
  '())

(defun ess/post-init-ess ()
  (add-hook 'R-mode-hook 'flycheck-mode)
  (add-hook 'ess-mode-hook
            (lambda()
              (setq mode-name "r!")))
  (bind-key* "M-n" 'flycheck-next-error)
  (bind-key* "M-p" 'flycheck-previous-error)
  (spacemacs/declare-prefix-for-mode 'ess-mode "mm" "markdown")
  (spacemacs/set-leader-keys-for-major-mode
               'ess-mode
               "mm"  'ess-rmarkdown
               "mp"  'ess-rmarkdown-preview))
