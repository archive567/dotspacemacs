;;; packages.el --- Extensions to Haskell Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq haskell-ext-packages
  '(
    yasnippet
    haskell-mode
    (hrefactor :location "~/.spacemacs.d/contrib/haskell-ext/local")
    ))

(defun haskell-ext/init-hrefactor ()
    (use-package hrefactor))

(defun haskell-ext/pre-init-haskell-mode ()
  (setq haskell-ext-enable-hrefactor-support t)
  (spacemacs|use-package-add-hook haskell-mode
    :post-config
    (progn
      ;; hooks
      (defun yas-hack ()
        (set (make-local-variable 'yas-fallback-behavior) 'call-other-command))
      (add-hook 'haskell-mode-hook 'yas-hack)
      (add-hook 'haskell-interactive-mode-hook
                (lambda ()
                  (setq-local evil-move-cursor-back nil)))
      (remove-hook 'haskell-mode-hook 'interactive-haskell-mode)
      (defadvice haskell-interactive-switch (after spacemacs/haskell-interactive-switch-advice activate)
        (when (eq dotspacemacs-editing-style 'hybrid)
          (call-interactively 'evil-insert)))
      (defun haskell-indentation-advice ()
        (when (and (< 1 (line-number-at-pos))
                   (save-excursion
                     (forward-line -1)
                     (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
          (delete-region (line-beginning-position) (point))))

      (advice-add 'haskell-indentation-newline-and-indent
                  :after 'haskell-indentation-advice)
      ;; keybindings
      (bind-key "M-p"         'flycheck-previous-error haskell-mode-map)
      (bind-key "M-n"         'flycheck-next-error haskell-mode-map)

      (spacemacs/declare-prefix-for-mode 'haskell-mode "mf" "flycheck")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mi" "repl")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mm" "imports")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mr" "refactor")

      (evil-leader/set-key-for-mode 'haskell-mode
        ;; "m["     'emacs-ext-align-code
        ;; "mf d"     'emacs-ext-toggle-display-flycheck
        "mlc"     'flycheck-haskell-configure
        "mlf"     'flycheck-buffer
        "mlv"     'flycheck-verify-setup
        "mlh"     'helm-flycheck
        "mlt"     'flycheck-mode
        "mls"     'flycheck-select-checker
        "mil"   'haskell-process-load-file
        "mik"   'haskell-interactive-kill
        "mic"   'haskell-interactive-clear
        "mir"   'haskell-process-restart
        "mib"   'haskell-interactive-bring
        "mis"   'haskell-interactive-switch
        "miz"     'haskell-process-load-or-reload
        "mma"     'haskell-align-imports
        "mmn"     'haskell-navigate-imports
        "mms"     'haskell-sort-imports
        "mrd"     'hindent/reformat-decl
        "mv"     'mmm-parse-buffer)
      (if haskell-ext-enable-hrefactor-support
       (evil-leader/set-key-for-mode 'haskell-mode
        "mrf"     'hrefactor-flycheck-fix-all
        "mrp"     'hrefactor-flycheck-fix-hlints-at-point
        "mrr"     'hrefactor-reformat-module
        "mra"     'hrefactor-all)))))
