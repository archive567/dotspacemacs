(defconst haskell-ext-packages
  '())

(spacemacs|use-package-add-hook dante
  :pre-init
  ;; Code
  :post-init
  ;; Code
  :pre-config
  ;; Code
  :post-config
  ;; Code
  (flycheck-add-next-checker 'haskell-dante '(warning . haskell-hlint)))

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
    (add-hook 'haskell-mode-hook
              (lambda()
                (setq mode-name "hs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq mode-name "lhs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq-local mode-line-process nil)))))
