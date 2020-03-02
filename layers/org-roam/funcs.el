;;; funcs.el --- Org Extension Layer functions for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun org-roam--file-name-title (title)
  "Return a file name (without extension) for new files.

It uses TITLE and may not be a unique title."
  (let ((slug (org-roam--title-to-slug title)))
    (format "%s" slug)))

