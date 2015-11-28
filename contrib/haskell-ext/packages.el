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
    mmm-mode
    yasnippet
    haskell-mode
    helm-flycheck
    hrefactor
    ))

(defun haskell-ext/pre-init-mmm-mode ()
    (spacemacs|use-package-add-hook mmm-mode
      :post-init
      (progn
        (mmm-add-classes
         '((markdown-lhs
            :submode markdown-mode
            :front "^[^>]"
            :include-front true
            :back "\\(^>\\)\\|\\'")))
        (mmm-add-mode-ext-class 'literate-haskell-mode "\\.lhs\\'" 'markdown-lhs))))

(defun haskell-ext/init-helm-flycheck ()
    (use-package helm-flycheck))

(defun haskell-ext/init-hrefactor ()
    (use-package hrefactor))

(defun haskell-ext/pre-init-haskell-mode ()
  (setq haskell-enable-ghc-mod-support nil)
  ;;(setq haskell-ext-enable-hrefactor-support nil)
  (spacemacs|use-package-add-hook haskell-mode
    :post-config
    (progn
      ;; hooks
      (defun yas-hack ()
        (set (make-local-variable 'yas-fallback-behavior) 'call-other-command))
      (add-hook 'haskell-mode-hook 'yas-hack)

      ;; keybindings
      (bind-key "<return>" 'electric-newline-and-maybe-indent haskell-mode-map)
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
