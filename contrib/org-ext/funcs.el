;;; funcs.el --- Org Extension Layer functions for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defun org-ext/insert-org-todo-list ()
  (org-set-sorting-strategy 'todo)
  (let ((rtnall nil)
        (rtn nil)
        (files (org-agenda-files nil 'ifmode))
        (date (calendar-gregorian-from-absolute (org-today))))
    (while (setq file (pop files))
      (setq rtn (org-agenda-get-day-entries file date :todo))
      (setq rtnall (append rtnall rtn)))
  (insert (org-agenda-finalize-entries rtnall 'todo) "\n")))

(defun org-ext/insert-startupify-org-list ()
  (interactive)
  (with-current-buffer (get-buffer-create "*spacemacs*")
    (let ((buffer-read-only nil)
          (list-separator "\n\n"))
      (goto-char (point-max))
      ;; (page-break-lines-mode)
      ;; (spacemacs-buffer/insert-page-break)
      ;; (mapc (lambda (el)
      ;;         (cond
      ;;          ((eq el 'org-todo)
      ;;           (org-agenda-mode)
      ;;           (insert "todo:")
      ;;           (when (org-ext/insert-org-todo-list)
      ;;             (spacemacs//insert--shortcut "t" "todo:")
      ;;             (insert list-separator)))
      ;;          )) dotspacemacs-startup-lists))))
      ;; (org-agenda-mode)
      (insert "todo:")
      (insert "\n")
      (org-ext/insert-org-todo-list)
      (spacemacs//insert--shortcut "t" "todo:")
      (insert "\n"))))


(defun org-ext-agenda-jump ()
  (interactive)
  (let ((buf (get-buffer "*Org Agenda*"))
	wind)
    (if buf
	(if (setq wind (get-buffer-window buf))
	    (when (called-interactively-p 'any)
	      (select-window wind)
	      (org-fit-window-to-buffer))
	  (if (called-interactively-p 'any)
	      (progn
		(select-window (display-buffer buf t t))
		(org-fit-window-to-buffer))
	    (with-selected-window (display-buffer buf)
	      (org-fit-window-to-buffer))))
      (call-interactively 'org-agenda-list))))

(defun org-ext-jump ()
  (interactive)
  (bookmark-set "org-jumped-from")
  (org-refile t nil nil "Jump")
  (bookmark-set "org-jumped-to"))

(defun org-ext-jump-back()
  (interactive)
  (if (equal (point) (bookmark-get-position "org-jumped-from"))
      (bookmark-jump "org-jumped-to")
    (if (bookmark-get-position "org-jumped-to")
        (bookmark-jump "org-jumped-from"))))

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
