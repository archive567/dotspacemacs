(defconst haskell-ext-packages
  '(ormolu))

(defun haskell-ext/init-ormolu ()
  (use-package ormolu
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
        "ro" 'ormolu-format-buffer
        "rO" 'ormolu-format-region
        "ru" 'ormolu-unline-fragment))))

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
    (add-hook 'haskell-interactive-mode-hook
              (lambda ()
                (setq-local evil-move-cursor-back nil)))
    (defadvice haskell-interactive-switch
        (after spacemacs/haskell-interactive-switch-advice activate)
      (when (eq dotspacemacs-editing-style 'vim)
        (call-interactively 'evil-insert)))
    (spacemacs/enable-flycheck 'literate-haskell-mode)
    (add-hook 'haskell-mode-hook
              (lambda()
                (setq mode-name "hs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq mode-name "lhs")))
    (add-hook 'literate-haskell-mode-hook
              (lambda()
                (setq-local mode-line-process nil)))
    (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
      "n" 'flycheck-next-error
      "p" 'flycheck-previous-error)))

(defun ormolu-unline-fragment ()
  "Replace newlines and indentation with one space to the next indentation level"
  (interactive)
  (save-excursion
    (back-to-indentation)
    (let ((scol (current-column)))
      (while
          (progn
            (re-search-forward "\n\\s-*")
            (when (> (current-column) scol)
              (replace-match " "))
            (> (current-column) scol)
            )
        )
      )
    )
  )



