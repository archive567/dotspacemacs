;;; packages.el --- Miscellanea Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq miscellanea-packages
      '(
        ;;farmhouse-theme
        yasnippet
        ))

(defun miscellanea/pre-init-yasnippet ()
    (spacemacs|use-package-add-hook yasnippet
      :pre-init
      (progn
        ;; yasnippet hardcodes the first element as ~/.emacs.d/snippets and then
        ;; assumes that the first element on the list is the one new snippets are saved to.
        (setq auto-completion-private-snippets-directory "~/.spacemacs.d/snippets")
        )))

;; (defun miscellanea/init-farmhouse-theme ()
;;   (message "hard-loading farmhouse-light")
;;   (when spacemacs--cur-theme
;;     (disable-theme spacemacs--cur-theme))
;;   (spacemacs/load-theme 'farmhouse-light)
;; )




;; (defun miscellanea/init-farmhouse-theme ()
;;   (use-package farmhouse-theme
;;     :config
;;     (load-theme 'farmhouse-light t)
;;     ))
