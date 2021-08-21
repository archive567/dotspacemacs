(setq org-random-packages
      '(
        ))

(defun org/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-init
    (progn
      (add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((emacs-lisp . t)
         ))
      (evil-leader/set-key-for-mode 'org-mode
        "R" 'org-random)
      (evil-leader/set-key-for-mode 'org-agenda-mode
        "R" 'org-random)
      (setq org-link-types '("http" "https" "ftp" "mailto" "file" "news"
                             "elisp" "doi" "message")))))

(defun org-random (&optional arg)
  "Select and goto a random todo item from the global agenda"
  (interactive "P")
  (if (and (stringp arg) (not (string-match "\\S-" arg))) (setq arg nil))
  (let* ((today (org-today))
         (date (calendar-gregorian-from-absolute today))
         (kwds org-todo-keywords-for-agenda)
         (lucky-entry nil)
         (completion-ignore-case t)
         (org-select-this-todo-keyword
          (if (stringp arg) arg
            (and arg (integerp arg) (> arg 0)
                 (nth (1- arg) kwds))))
         rtn rtnall files file pos marker buffer)
    (when (equal arg '(4))
      (setq org-select-this-todo-keyword
            (org-icompleting-read "Keyword (or KWD1|K2D2|...): "
                                  (mapcar 'list kwds) nil nil)))
    (and (equal 0 arg) (setq org-select-this-todo-keyword nil))
    (catch 'exit
      (org-compile-prefix-format 'todo)
      (org-set-sorting-strategy 'todo)
      (setq files (org-agenda-files nil 'ifmode)
            rtnall nil)
      (while (setq file (pop files))
        (catch 'nextfile
          (org-check-agenda-file file)
          (setq rtn (org-agenda-get-day-entries file date :todo))
          (setq rtnall (append rtnall rtn))))

      (when rtnall
        (setq lucky-entry
              (nth (random
                    (safe-length
                     (setq entries rtnall)))
                   entries))

        (setq marker (or (get-text-property 0 'org-marker lucky-entry)
                         (org-agenda-error)))
        (setq buffer (marker-buffer marker))
        (setq pos (marker-position marker))
        (org-pop-to-buffer-same-window buffer)
        (widen)
        (goto-char pos)
        (when (derived-mode-p 'org-mode)
          (org-show-context 'agenda)
          (save-excursion
            (and (outline-next-heading)
                 (org-flag-heading nil))) ; show the next heading
          (when (outline-invisible-p)
            (show-entry))               ; display invisible text
          (run-hooks 'org-agenda-after-show-hook))))))
