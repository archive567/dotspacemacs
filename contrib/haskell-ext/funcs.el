;;; haskell-ext.el

;;; Commentary:
;; some extensions to haskell mode, often in conjunction with other packages

;;; Code:


(defvar haskell-ext-flycheck-refactor-prefix
  "refactor-"
  "prefix for refactor file")

(defvar haskell-ext-flycheck-refactor-save-backup
  t
  "save a backup after a refactor")


;; new buffer method
(defun haskell-ext-flycheck-fix-hlints-all ()
  "Fix all flycheck errors in buffer."
  (interactive)
  (save-excursion
    (let ((buf
           (create-file-buffer (format "%s%s"
                                       haskell-ext-flycheck-refactor-prefix
                                       (buffer-name)))))
    
      (goto-char (point-min))
      (while (< (point) (point-max))
        ;;(copy-goto-next-error refactor-buffer)
        (fix-then-copy-to-next-err buf))
      (with-current-buffer buf (copy-region-as-kill (point-min) (point-max)))
      (goto-char (point-min))
      (yank)
      (kill-region (point) (point-max)))))

(defun fix-then-copy-to-next-err (buf)
  "fix errors at point (if possible) then copy to next flycheck error"
  (let* ((start (point))
         (next (flycheck-next-error-pos 1)
               )
         (end (if next
                  next
                (point-max))))
    (let ((errs (flycheck-overlay-errors-at start)))
      (while (and
              errs
              (= start (point)))
      (let ((err (car errs)))
        (setq errs (cdr errs))
        (fix-err err buf))))
    
    ;; point might already be past next error
    (when (< (point) end)
      (copy-region-as-kill (point) end)
      (goto-char end)
      (with-current-buffer buf (yank)))))

(defun fix-err (err buf)
  "fix err, moving point past the fixed code, if any"
  (let* ((msg (flycheck-error-message err))
         (spot (flycheck-error-line err)))
    (cond ((string-match (haskell-ext-flycheck-typemessage-re) msg)
           (with-current-buffer buf
             (insert
              (haskell-ext-flycheck-clean-sig
               (match-string 1 msg)))))
          ((string-match (haskell-ext-flycheck-redundant-import-re)
                         msg)
           (move-to-next-import))
          ((string-match (haskell-ext-flycheck-whynot-re)
                         msg)
           (haskell-ext-flycheck-replace-whynot err buf)))))

(defun move-to-next-import ()
  "move point to next import statement, or next line if no more imports"
  (progn
    (let*
        ((start (point)))
      (if (search-forward-regexp "\nimport" (point-max) t)
          (goto-char (+ 1 (match-beginning 0)))
        (when (search-forward-regexp "\n" (point-max) t))
        (goto-char (+ 1 (match-beginning 0)))))))

(defun haskell-ext-flycheck-replace-whynot (err buf)
  (let* ((msg (flycheck-error-message err))
         (spot (flycheck-error-line err))
         (parts
          (mapcar (lambda (x) (mapcar 'haskell-ext-flycheck-fix-lambda x)) (haskell-ext-flycheck-hlint-parts msg)))
         (re (haskell-ext-flycheck-main-re parts)))
    (when (search-forward-regexp re (point-max) t)
      (with-current-buffer buf
        (insert
         (reduce
          #'concat
          (haskell-ext-flycheck-interleave
           (nth 1 parts)
           (mapcar
            'match-string
            (number-sequence 1 (- (length (nth 1 parts)) 1))))))))))

;; in place methods
(defun haskell-ext-flycheck-fix-hlints-at-point ()
  "Insert flycheck hint at point."
  (interactive)
  (let ((errs (flycheck-overlay-errors-at (point))))
    (when errs
      (-each errs 'haskell-ext-flycheck-fix-hlint))))

(defun haskell-ext-flycheck-fix-hlint (err)
  (save-excursion
    (let* ((msg (flycheck-error-message err))
           (spot (flycheck-error-line err)))
      (cond ((string-match (haskell-ext-flycheck-typemessage-re) msg)
             (insert
              (haskell-ext-flycheck-clean-sig
               (match-string 1 msg))))
            ((string-match (haskell-ext-flycheck-redundant-import-re)
                           msg)
             (delete-to-next-import))
            )
      )))

(defun delete-to-next-import ()
  "delete region from point to next import statement"
  (progn
         (let*
             ((start (point)))
           (if (search-forward-regexp "\nimport" (point-max) t)
               (delete-region start (+ 1 (match-beginning 0)))
             (when (search-forward-regexp "\n" (point-max) t))
             (delete-region start (+ 1 (match-beginning 0)))) 
           )
         ))


(defun haskell-ext-flycheck-insert-why-nots ()
  "Insert flycheck found/why not? hint at point."
  (interactive)
  (let ((errs (flycheck-overlay-errors-at (point))))
    (when errs
      (-each errs 'haskell-ext-flycheck-insert-lint))))

(defun haskell-ext-flycheck-insert-type-bindings ()
  "Insert all flycheck type binding guesses."
  (interactive)
  (goto-char (point-min))
  (message
        "added %d type sigs"
        (fromMaybe 0 (let*
             ((added 0)
              (changes
               (mapcar
                (lambda (x)
                  (when
                      (haskell-ext-flycheck-is-type-bind x)
                    (goto-line
                     (+ added
                        (flycheck-error-line x)))
                    (haskell-ext-flycheck-insert-sig-at-point x)
                    (setq added (+ 1 added))))
                flycheck-current-errors)))
           (car (last (delq nil changes)))))))

(defun haskell-ext-flycheck-insert-type-binding ()
  "Insert the flycheck guess at the type binding."
  (interactive)
  (haskell-ext-flycheck-insert-sig (flycheck-overlay-errors-at (point))))

(defun haskell-ext-flycheck-insert-sig-at-point (err)
  (let ((msg
         (haskell-ext-flycheck-get-sig (flycheck-error-message err))))
    (when msg
      (insert (haskell-ext-flycheck-clean-sig msg)))))

(defun haskell-ext-flycheck-insert-sig (errs)
  (when errs
    (-each errs
           (lambda (e)
             (let ((msg
                    (haskell-ext-flycheck-get-sig (flycheck-error-message e))))
               (when msg
                 (insert (haskell-ext-flycheck-clean-sig msg))))))))

(defun haskell-ext-flycheck-is-type-bind (e)
  (string-match
   (haskell-ext-flycheck-typemessage-re)
   (flycheck-error-message e)))

(defun haskell-ext-flycheck-get-sig (msg)
  (when (string-match
         (haskell-ext-flycheck-typemessage-re)
         msg)
    (match-string 1 msg)))

(defun haskell-ext-flycheck-clean-sig (msg)
  (with-temp-buffer
  (insert msg)
  (goto-char (point-min))
  (replace-regexp
   (haskell-ext-flycheck-forall-re)
   "")
  (goto-char (point-min))
  (replace-regexp (rx "=>") "=> ")
  (goto-char (point-min))
  (replace-regexp
   (rx
    (and
     (1+ "\n")
     (0+ blank)))
   "")
  (goto-char (point-max))
  (insert "\n")
  (buffer-string)))

(defun haskell-ext-flycheck-forall-re ()
  (rx
   (and
    "forall"
    (1+ any)
    (1+ ".")
    (0+ blank))))

(defun haskell-ext-flycheck-typemessage-re ()
  (rx
   (and
    "Top-level binding with no type signature:"
    (0+ "\n")
    (0+ blank)
    (group
     (0+ (or
          any
          "\n"))))))

(defun haskell-ext-flycheck-redundant-import-re ()
  (rx
   (and
    (or
     "The import of "
     "The qualified import of ")
    (1+ not-newline)
    " is redundant")))

(defun haskell-ext-flycheck-whynot-re ()
  (rx
   (and
    "Found:\n"
    (0+ blank)
    (group (1+ (or any "\n")))
    (1+ "\n")
    "Why not:\n"
    (0+ blank)
    (group (1+ (or any "\n"))))))

(defun haskell-ext-flycheck-hlint-re ()
  (rx
   (and
    "Found:\n"
    (0+ blank)
    (group (1+ (or any "\n")))
    (1+ "\n")
    "Why not:\n"
    (0+ blank)
    (group (1+ (or any "\n"))))))

(defun haskell-ext-flycheck-hlint-line-re ()
  (rx
   (and
    (0+ blank)
    (group (1+ any)))))

(defun haskell-ext-flycheck-lint-lines (str)
  (with-temp-buffer
    (goto-char (point-min))
    (kill-region (point) (point-max))
    (insert str)
    (goto-char (point-min))
    (let ((parts nil))
      (while
          (search-forward-regexp (haskell-ext-flycheck-hlint-line-re) (point-max) t)
        (push (match-string 1) parts))
      (reverse parts))))

(defun haskell-ext-flycheck-hlint-parts (hlint-msg)
  (with-temp-buffer
    (insert hlint-msg)
    (goto-char (point-min))
    (search-forward-regexp (haskell-ext-flycheck-hlint-re) (point-max) t)
    ;; get individual lines
    (let* ((sfound (match-string 1))
           (swhynot (match-string 2)))
      (list
       (haskell-ext-flycheck-lint-lines sfound)
       (haskell-ext-flycheck-lint-lines swhynot)))))

(defun haskell-ext-flycheck-main-re (parts)
  (mapconcat
   'identity
   (mapcar
    (lambda (x) (regexp-opt (list x)))
    (car parts))
   "\\(\\(?:[[:blank:]]\\|\n\\)+\\)"))

(defun haskell-ext-flycheck-fix-lambda (str)
  (with-temp-buffer
    (insert str)
    (goto-char (point-min))
    (if (search-forward-regexp "\\\\ " (point-max) t)
        (progn
          (replace-match "\\\\")
            (buffer-string))
      str)))

(defun haskell-ext-flycheck-insert-lint (err)
  (save-excursion
    (let* ((msg (flycheck-error-message err))
           (spot (flycheck-error-line err))
           (parts
            (mapcar (lambda (x) (mapcar 'haskell-ext-flycheck-fix-lambda x)) (haskell-ext-flycheck-hlint-parts msg)))
           (re (haskell-ext-flycheck-main-re parts)))
      (when (search-forward-regexp re (point-max) t)
        (replace-match
         (reduce
          #'concat
          (haskell-ext-flycheck-interleave
           (nth 1 parts)
           (mapcar
            'match-string
            (number-sequence 1 (- (length (nth 1 parts)) 1))))))))))

(defun haskell-ext-flycheck-interleave (l1 l2)
"(haskell-ext-flycheck-interleave (list 1 1 1) (list 0 0))  '(1 0 1 0 1)."
  (cond ((and (eql l1 nil) (eql l2 nil)) nil)         ;; rule #1
        ((eql l1 nil) (cons nil (haskell-ext-flycheck-interleave l2 l1)))  ;; rule #2, current value is nil
        (t (cons (first l1) (haskell-ext-flycheck-interleave l2 (cdr l1)))))) ;; rule #3 in all
;; other cases

(defun fromMaybe (default x)
  (if x
      x
    default))

(defun haskell-ext-cabal-cd-dir (&optional dir)
  "Change to project base directory"
  (let ((cabal-dir (haskell-cabal-find-dir dir)))
    (when cabal-dir
      (cd cabal-dir))))

(defcustom haskell-ext-mode-message-line-multi t
  "allow multiple lines in mini-buffer"
  :group 'haskell-ext)

(defadvice haskell-mode-message-line (around multi-line
                                             activate)
  (if haskell-ext-mode-message-line-multi
      (message "%s" (ad-get-arg 0))
    (ad-do-it (ad-get-arg 0))))

(defcustom haskell-ext-yas-common-imports
  (list)
  "List of common imports."
  :group 'haskell-ext
  :type '(repeat string))

(defcustom haskell-ext-yas-common-options
  (list)
  "List of language pragmas supported by the installed version of GHC."
  :group 'haskell-ext
  :type '(repeat string))

(defun haskell-ext-add-missing-packages ()
  (save-excursion
    (goto-char (or compilation-filter-start (point-min)))
    (when (re-search-forward
           (concat "It is a member of the hidden package"
                   " `\\(.+?\\)-\\([0-9].+\\)'\\.") nil t)
      (let ((cabal-file (haskell-cabal-find-file))
            (package (match-string 1))
            (version (match-string 2)))
        (message "Found build depends: %s-%s" package version)
        (when cabal-file
          (message "Cabal file is %s" cabal-file)
          (with-current-buffer (find-file cabal-file)
            (goto-char (point-max))
            (when (re-search-backward "[Bb]uild-depends:" nil t)
              (message "Found build depends")
              (forward-paragraph)
              (indent-according-to-mode)
              (insert ", " package " >= " version))))))))

(defun haskell-ext-cabal-cd-dir (&optional dir)
      "Change to project base directory"
      (let ((cabal-dir (haskell-cabal-find-dir dir)))
        (when cabal-dir
          (cd cabal-dir))))

(defun haskell-ext-hayoo-search (query)
  "Search hayoo for query."
  (let ((results
        (mapcar
         (lambda (result) (cons (helm-hayoo-format-result result) result))
         (append (assoc-default 'result
                                (helm-hayoo-do-search query)) nil))))
    results))

(defun haskell-ext-hayoo-package (query)
  "Extract package list from hayoo result"
  (delete-dups
        (mapcar
         (lambda (r) (assoc-default 'resultPackage r))
         (haskell-ext-hayoo-search query))))

(defun haskell-ext-hayoo-module (query)
  "Extract module list from hayoo result"
  (delete-dups
        (mapcar
         (lambda (r) (assoc-default 'resultModules r))
         (haskell-ext-hayoo-search query))))

(defun haskell-ext-hayoo-module-package (query)
  "Extract module-pakage pair list from hayoo result"
  (delete-dups
        (mapcar
         (lambda (r) (cons
                      (assoc-default 'resultPackage r)
                      (assoc-default 'resultModules r)))
         (haskell-ext-hayoo-search query))))



(defun haskell-ext-reformat-module ()
  "Re-format the entire module at once."
  (interactive)
  (let ((start-end (cons (point-min) (point-max))))
    (when start-end
      (let ((original (current-buffer))
            (orig-str (buffer-substring-no-properties (car start-end)
                                                      (cdr start-end))))
        (with-temp-buffer
          (let ((temp (current-buffer)))
            (with-current-buffer original
              (let ((ret (call-process-region (car start-end)
                                              (cdr start-end)
                                              "xyzzy"
                                              nil  ; delete
                                              temp ; output
                                              nil
                                              "--style"
                                              hindent-style)))
                (cond
                 ((= ret 1)
                  (let ((error-string
			 (with-current-buffer temp
                           (let ((string (progn (goto-char (point-min))
                                                (buffer-substring (line-beginning-position)
                                                                  (line-end-position)))))
                             string))))
		    (if (string= error-string "hindent: Parse error: EOF")
			(message "language pragma")
		      (error error-string))))
                 ((= ret 0)
                  (let ((new-str (with-current-buffer temp
                                   (buffer-string))))
                    (if (not (string= new-str orig-str))
                        (progn
                          (delete-region (car start-end)
                                         (cdr start-end))
                          (insert new-str)
                          (message "Formatted."))
                      (message "Already formatted.")))))))))))))

