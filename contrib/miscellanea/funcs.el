;;; funcs.el --- Miscellanea Layer functions for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun miscellanea/default-frame ()
  (interactive)
  (set-frame-parameter (selected-frame) 'fullscreen nil)
  (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
  (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
  (set-frame-parameter (selected-frame) 'top 20)
  (set-frame-parameter (selected-frame) 'left 1)
  (set-frame-parameter (selected-frame) 'height 47)
  (set-frame-parameter (selected-frame) 'width 85))

(defun miscellanea/default-right-frame ()
  (interactive)
  (set-frame-parameter (selected-frame) 'fullscreen nil)
  (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
  (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
  (set-frame-parameter (selected-frame) 'top 20)
  (set-frame-parameter (selected-frame) 'left 735)
  (set-frame-parameter (selected-frame) 'height 47)
  (set-frame-parameter (selected-frame) 'width 85))


(defun miscellanea/max-frame ()
  (interactive)
  (if t
      (progn
	(set-frame-parameter (selected-frame) 'fullscreen 'fullboth)
	(set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
	(set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil))
    (set-frame-parameter (selected-frame) 'top 26)
    (set-frame-parameter (selected-frame) 'left 2)
    (set-frame-parameter (selected-frame) 'width
			 (floor (/ (float (x-display-pixel-width)) 9.15)))
    (if (= 1050 (x-display-pixel-height))
	(set-frame-parameter (selected-frame) 'height
			     (if (>= emacs-major-version 24)
				 66
			       55))
      (set-frame-parameter (selected-frame) 'height
			   (if (>= emacs-major-version 24)
			       75
			     64)))))

(defun miscellanea/toggle-size ()
  (interactive)
  (if (> (cdr (assq 'width (frame-parameters))) 100)
      (miscellanea/min-frame)
    (miscellanea/max-frame)))

(defun miscellanea/transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(defun miscellanea/refill-paragraph (arg)
  (interactive "*P")
  (let ((fun (if (memq major-mode '(c-mode c++-mode))
                 'c-fill-paragraph
               (or fill-paragraph-function
                   'fill-paragraph)))
        (width (if (numberp arg) arg))
        prefix beg end)
    (forward-paragraph 1)
    (setq end (copy-marker (- (point) 2)))
    (forward-line -1)
    (let ((b (point)))
      (skip-chars-forward "^A-Za-z0-9`'\"(")
      (setq prefix (buffer-substring-no-properties b (point))))
    (backward-paragraph 1)
    (if (eolp)
        (forward-char))
    (setq beg (point-marker))
    (delete-horizontal-space)
    (while (< (point) end)
      (delete-indentation 1)
      (end-of-line))
    (let ((fill-column (or width fill-column))
          (fill-prefix prefix))
      (if prefix
          (setq fill-column
                (- fill-column (* 2 (length prefix)))))
      (funcall fun nil)
      (goto-char beg)
      (insert prefix)
      (funcall fun nil))
    (goto-char (+ end 2))))

(defun miscellanea/unfill-paragraph (arg)
  (interactive "*p")
  (let (beg end)
    (forward-paragraph arg)
    (setq end (copy-marker (- (point) 2)))
    (backward-paragraph arg)
    (if (eolp)
        (forward-char))
    (setq beg (point-marker))
    (when (> (count-lines beg end) 1)
      (while (< (point) end)
        (goto-char (line-end-position))
        (let ((sent-end (memq (char-before) '(?. ?\; ?! ??))))
          (delete-indentation 1)
          (if sent-end
              (insert ? )))
        (end-of-line))
      (save-excursion
        (goto-char beg)
        (while (re-search-forward "[^.;!?:]\\([ \t][ \t]+\\)" end t)
          (replace-match " " nil nil nil 1))))))

(defun miscellanea/unfill-region (beg end)
  (interactive "r")
  (setq end (copy-marker end))
  (save-excursion
    (goto-char beg)
    (while (< (point) end)
      (miscellanea/unfill-paragraph 1)
      (forward-paragraph))))


(defun miscellanea/emacs-debug-init ()
  (interactive)
  (call-process "/Applications/Emacs.app/Contents/MacOS/Emacs" nil 0 nil "--debug-init")
  (message "Started 'emacs --debug-init' - it will be ready soon ..."))
