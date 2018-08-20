
;;; style-ext.el --- personal stylistic tweaks for Emacs
;; Author: Tony Day
;; Keywords: 
;; Package-Requires: ((emacs "25.2"))
;; This file is NOT part of GNU Emacs.

 ;;; Commentary:
 ;;; Code:

(defun style-ext/default-frame ()
  (interactive)
  (cond
   ((string-equal system-type "windows-nt") ; Microsoft Windows
    (progn
      (set-frame-parameter (selected-frame) 'fullscreen nil)
      (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'top 10)
      (set-frame-parameter (selected-frame) 'left 6)
      (set-frame-parameter (selected-frame) 'height 40)
      (set-frame-parameter (selected-frame) 'width 120)))
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (set-frame-parameter (selected-frame) 'fullscreen nil)
      (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'top 30)
      (set-frame-parameter (selected-frame) 'left 11)
      (set-frame-parameter (selected-frame) 'height 49)
      (set-frame-parameter (selected-frame) 'width 100)
      (message "default-frame set")))
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (message "Linux")))))

;; (default-frame)
;; (add-hook 'after-init-hook 'default-frame)


(defun style-ext/default-right-frame ()
  (interactive)
  (cond
   ((string-equal system-type "windows-nt") ; Microsoft Windows
    (progn
      (set-frame-parameter (selected-frame) 'fullscreen nil)
      (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'top 10)
      (set-frame-parameter (selected-frame) 'left 2000)
      (set-frame-parameter (selected-frame) 'height 60)
      (set-frame-parameter (selected-frame) 'width 120)))
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (set-frame-parameter (selected-frame) 'fullscreen nil)
      (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
      (set-frame-parameter (selected-frame) 'top 20)
      (set-frame-parameter (selected-frame) 'left 735)
      (set-frame-parameter (selected-frame) 'height 47)
      (set-frame-parameter (selected-frame) 'width 85)))
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (message "Linux")))))

(defun style-ext/max-frame ()
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

(defun style-ext/toggle-frame-size ()
  (interactive)
  (if (> (cdr (assq 'width (frame-parameters))) 100)
      (min-frame)
    (max-frame)))

(defun style-ext/default-face-attribute ()
  (interactive)
  (cond
   ((string-equal system-type "windows-nt") ; Microsoft Windows
    (progn
      (set-face-attribute
       'default nil
       :family "Source Code Pro"
       :height 140
       :weight 'normal
       :width 'normal)))
   ((string-equal system-type "darwin") ; Mac OS X
    (progn
      (set-face-attribute
       'default nil
       :family "M+ 1m"
       :height 140
       :weight 'normal
       :width 'normal)))
   ((string-equal system-type "gnu/linux") ; linux
    (progn
      (message "Linux")))))

(provide 'style-ext)
;;; style-ext.el ends here
