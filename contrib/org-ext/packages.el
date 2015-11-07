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
        org
        (org-colview :location built-in)
        (org-checklist :location local)
        ;; page-break-lines
        ))

(defun org/init-org-checklist ()
  (use-package org-checklist))

(defun org/init-org-colview ()
  (use-package org-colview))

(defun org/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-init
    (progn
      (add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
      (evil-leader/set-key-for-mode 'org-mode
        "mr" 'org-ext-random-entry
        "mjj" 'org-ext-jump
        "mjb" 'org-ext-jump-back
        "mja" 'org-ext-jump-agenda)
      (setq org-link-types '("http" "https" "ftp" "mailto" "file" "news"
                             "elisp" "doi" "message")
            )
      )
    :post-config
    (progn
      ;;(org-ext/insert-startupify-org-list))

    )))
