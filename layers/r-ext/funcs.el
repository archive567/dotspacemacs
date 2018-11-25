;;; funcs.el --- Org Extension Layer functions for Spacemacs
;;
;; Copyright (c) 2015 Tony Day
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun ess-rmarkdown ()
  "Compile R markdown (.Rmd). Should work for any output type."
  (interactive)
                                        ; Check if attached R-session
  (condition-case nil
      (ess-get-process)
    (error 
     (ess-switch-process)))
  (let* ((rmd-buf (current-buffer)))
    (save-excursion
      (let* ((sprocess (ess-get-process ess-current-process-name))
             (sbuffer (process-buffer sprocess))
             (buf-coding (symbol-name buffer-file-coding-system))
             (R-cmd
              (format "library(knitr); knitr::knit(\"%s\")"
                      buffer-file-name)))
        (message "Running knit on %s" buffer-file-name)
        (ess-execute R-cmd 'buffer nil nil)
        (switch-to-buffer rmd-buf)
        (ess-show-buffer (buffer-name sbuffer) nil)))))

(defun ess-rmarkdown-preview ()
  "Compile R markdown (.Rmd) to markdown (.md) and preview (as html) in the browser."
  (interactive)
  (ess-rmarkdown)
  (ess-wait-for-process)
  (save-excursion
    (let ((file-name-md
          (concat
           (file-name-sans-extension (buffer-file-name))
           ".md"))
          (file-name-html
           (concat
            (file-name-sans-extension (buffer-file-name))
            ".html")))
      (with-temp-buffer
        (insert-file-contents file-name-md)
        (set-visited-file-name file-name-md t)
        (browse-url-of-file (markdown-export file-name-html))))))

