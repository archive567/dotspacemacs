(defconst haskell-ext-packages
  '())

(spacemacs|use-package-add-hook intero
  :pre-init
  ;; Code
  :post-init
  ;; Code
  :pre-config
  ;; Code
  :post-config
  ;; Code
  (progn
    (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
    (bind-key* "M-n" 'flycheck-next-error)
    (bind-key* "M-p" 'flycheck-previous-error)))

(spacemacs|use-package-add-hook haskell-mode
  :pre-init
  ;; Code
  :post-init
  ;; Code
  :pre-config
  ;; Code
  :post-config
  ;; Code
  (progn
    (spacemacs/enable-flycheck 'literate-haskell-mode)
    (add-hook 'haskell-mode-hook
              (lambda()
                (setq mode-name "hs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq mode-name "lhs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq-local mode-line-process nil)))))
