;;; keybindings.el --- Miscellanea Layer keybindings for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;; Assumes that use-package has already been loaded.
;; Defines keys both in terms of key-bindings and evil-leader
;; adopting C-, and ~SPC ,~
;;; License: GPLv3

(bind-key* "C-<return>" 'other-window)
(bind-key* "C-x C-k"     'kill-region)

(evil-leader/set-key
  ",,"  'other-window
  ",+"  'text-scale-increase
  ",-"  'text-scale-decrease
  ",["  'align-regexp
  ",fd" 'miscellanea/default-frame
  ",fm" 'miscellanea/max-frame
  ",fr" 'miscellanea/default-right-frame
  ",ft" 'miscellanea/toggle-size
  ",fo" 'other-frame
  ",fn" 'make-frame
  ",s"  'miscellanea/transpose-windows
  ",ir" 'miscellanea/indent-region
  ",ib" 'miscellanea/indent-buffer
  ",pf" 'miscellanea/refill-region
  ",pu" 'miscellanea/unfill-region
  ",pc" 'set-fill-column
  ",pt" 'toggle-truncate-lines
  ",an" 'find-name-dired
  ",ex" 'pp-eval-last-sexp
  ",ff" 'ff-find-other-file
  ",fl" 'find-library
  ",er" 'eval-region
  ",hr" 'helm-recentf
  ",lk" 'keep-lines
  ",bc" 'clean-buffer-list
  ",="  'count-matches
  ",lf" 'flush-lines
  ",hc" 'finder-commentary
  ",he" 'view-echo-area-messages
  ",hf" 'find-function
  ",hF" 'find-face-definition
  ",hi" 'info-apropos
  ",hk" 'find-function-on-key
  ",hl" 'find-library
  ",hv" 'find-variable
  ",hV" 'apropos-value
  ",db" 'ediff-buffers
  ",df" 'ediff-files
  ",dr" 'ediff-reveision
  ",dl" 'ediff-regions-linewise
  ",dw" 'ediff-regions-wordwise
  "j SPC" 'describe-bindings
)
