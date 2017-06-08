;;; packages.el --- Extensions to Org Layer packages file for Spacemacs
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

(setq org-ext-packages
      '(
        ))

(defun org/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-init
    (progn

      (add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((shell . t)
         (js . t)
         (emacs-lisp . t)))
      (evil-leader/set-key-for-mode 'org-mode
        "r" 'org-ext-random-entry)
      (setq org-link-types '("http" "https" "ftp" "mailto" "file" "news"
                             "elisp" "doi" "message")))))
