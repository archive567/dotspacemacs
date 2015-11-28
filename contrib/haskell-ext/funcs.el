;;; haskell-ext.el

;;; Commentary:
;; some extensions to haskell mode, often in conjunction with other packages

;;; Code:

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
