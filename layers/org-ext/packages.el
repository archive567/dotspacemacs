
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
       '((emacs-lisp . t)))
      (evil-leader/set-key-for-mode 'org-mode
        "r" 'org-ext-random-entry)
      (evil-leader/set-key-for-mode 'org-agenda-mode
        "r" 'org-ext-random-entry)
      (setq org-link-types '("http" "https" "ftp" "mailto" "file" "news"
                             "elisp" "doi" "message")))))
