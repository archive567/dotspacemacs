(defconst td-haskell-packages
  '(flycheck))

(defun td-haskell/post-config-intero ()
    (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

(defun td-haskell/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'literate-haskell-mode))

(spacemacs|use-package-add-hook intero
  :pre-init
  ;; Code
  :post-init
  ;; Code
  :pre-config
  ;; Code
  :post-config
  ;; Code
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
)

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
    (dolist (mode haskell-modes)
      (spacemacs/declare-prefix-for-mode mode "mr" "haskell/refactor")
      (spacemacs/declare-prefix-for-mode mode "mx" "haskell/flycheck")
      (spacemacs/declare-prefix-for-mode mode "mri" "haskell/refactor/imports")
      (evil-leader/set-key-for-mode mode
        "xc" 'flycheck-haskell-configure
        "xb" 'flycheck-buffer
        "xv" 'flycheck-verify-setup
        "xt" 'flycheck-mode
        "xs" 'flycheck-select-checker
        "xn" 'flycheck-next-error
        "xp" 'flycheck-previous-error
        "xh" 'td-haskell-add-hlint
        "ria" 'haskell-align-imports
        "rin" 'haskell-navigate-imports
        "ris" 'haskell-sort-imports
        "rd" 'hindent/reformat-decl))
    (when (bound-and-true-p interactive-haskell-mode)
      (when (fboundp 'interactive-haskell-mode)
        (message "Disabling interactive-haskell-mode ...")
        (interactive-haskell-mode -1)))
    (add-hook 'haskell-mode-hook
              (lambda()
                (setq mode-name "hs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq mode-name "lhs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq-local mode-line-process nil)))))



