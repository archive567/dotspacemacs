;;; flycheck-ghcjs.el --- flychecker for ghcjs -*- lexical-binding: t; -*-

;; Copyright (c) 2015 Tony Day <tonyday567@gmail.com>

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(flycheck-def-option-var flycheck-ghcjs-package-databases nil haskell-ghcjs
  "Additional module databases for ghcjs.

The value of this variable is a list of strings, where each
string is a directory of a package database.  Each package
database is given to ghcjs via `-package-db'."
  :type '(repeat (directory :tag "Package database"))
  :safe #'flycheck-string-list-p
  :package-version '(flycheck . "0.16"))

(flycheck-define-checker haskell-ghcjs
  "A Haskell syntax and type checker using ghcjs.
See URL `https://github.com/ghcjs/ghcjs'."
  :command ("ghcjs" "-Wall" "-fno-code"
            ;; Include the parent directory of the current module tree, to
            ;; properly resolve local imports
            (eval (concat
                   "-i"
                   (flycheck-module-root-directory
                    (flycheck-find-in-buffer flycheck-haskell-module-re))))
            (option-list "-package-db" flycheck-ghcjs-package-databases)
            (option-list "-i" flycheck-ghc-search-path s-prepend)
            source)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ":"
            (or " " "\n    ") "Warning:" (optional "\n")
            (one-or-more " ")
            (message (one-or-more not-newline)
                     (zero-or-more "\n"
                                   (one-or-more " ")
                                   (one-or-more not-newline)))
            line-end)
   (error line-start (file-name) ":" line ":" column ":"
          (or (message (one-or-more not-newline))
              (and "\n" (one-or-more " ")
                   (message (one-or-more not-newline)
                            (zero-or-more "\n"
                                          (one-or-more " ")
                                          (one-or-more not-newline)))))
          line-end))
  :modes haskell-mode)

(defun flycheck-ghcjs-configure ()
  "Set paths and package database for the current project."
  (interactive)
  (when (buffer-file-name)
    (-when-let* ((cabal-file (haskell-cabal-find-file))
                 (config (flycheck-haskell-get-configuration cabal-file)))
      (flycheck-haskell-process-configuration config))
    
    (-when-let* ((config (flycheck-haskell-find-sandbox-config))
                 (package-db (flycheck-haskell-get-package-db config)))
      (setq-local flycheck-ghcjs-package-databases
                  (cons package-db flycheck-ghcjs-package-databases))
      (setq-local flycheck-ghc-no-user-package-database t))))

(defun flycheck-ghc-configure ()
  "Set current project details based on active checker"
  (interactive)
  (cond ((eq flycheck-checker 'haskell-ghc)
         (flycheck-haskell-configure))
        ((eq flycheck-checker 'haskell-ghcjs)
         (flycheck-ghcjs-configure))))


(defun flycheck-ghcjs-get-package-db (sandbox-config-file)
  "Get package database directories from SANDBOX-CONFIG-FILE.
With ghcjs, there is more than one."
  (with-temp-buffer
    (insert-file-contents sandbox-config-file)
    (goto-char (point-min))
    (let ((dbs nil))
      (while (re-search-forward flycheck-haskell-package-db-re nil 'noerror)
        (setq dbs (cons (match-string 1) dbs)))
      dbs)))

(defun flycheck-ghcjs-switch ()
  "switch to ghcjs flychecking"
  (interactive)
  (flycheck-select-checker 'haskell-ghcjs)
  (flycheck-ghcjs-configure))

(provide 'flycheck-ghcjs)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; flycheck-ghcjs.el ends here
