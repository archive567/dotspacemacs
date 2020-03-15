;;; funcs.el --- Org Extension Layer functions for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun org-ext-random-entry (&optional arg)
  "Select and goto a random todo item from the global agenda"
  (interactive "P")
  (if org-agenda-overriding-arguments
      (setq arg org-agenda-overriding-arguments))
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

(defun org-cliplink-multi ()
  (require 'org-cliplink)
  (interactive)
  (mapcar (lambda (x)
            (org-cliplink-insert-transformed-title x 'org-cliplink-org-mode-link-transformer-nl))
          (org-split-string (org-cliplink-clipboard-content))))

(defun org-cliplink-org-mode-link-transformer-nl (url title)
  (if title
      (format "[[%s][%s]]\n" url (org-cliplink-elide-string
                                (org-cliplink-escape-html4
                                 (org-cliplink-title-for-url url title))
                                org-cliplink-max-length))
    (format "[[%s]]\n" url)))

