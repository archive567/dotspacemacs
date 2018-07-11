(defconst lsp-mode-packages
  '(
    (company-lsp)
    (lsp-mode)
    (lsp-ui :requires lsp-mode)
    (lsp-haskell :requiers lsp-mode lsp-ui)
    ))

(defun lsp-mode/init-lsp-mode ())

(defun lsp-mode/init-company-lsp ()
  (use-package company-lsp
    :defer t
    :commands (company-lsp)
    :init
    (progn
      (setq company-lsp-async t))))

(defun lsp-mode/init-lsp-ui ()
  (use-package lsp-ui
    :defer t
    :commands (lsp-ui-mode)
    :init
    (add-hook 'lsp-mode-hook #'lsp-ui-mode)))

(defun lsp-mode/init-lsp-haskell ()
  (use-package lsp-haskell
    :defer t
    :commands (lsp-haskell-mode)
    :init
    (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
    (add-hook 'haskell-mode-hook 'flycheck-mode)))

