;; 1. place this in ~/.emacs.d/private/intero/packages.el

;; 2. add intero, syntax-checking and auto-completion to your
;; ~/.spacemacs layer configuration & remove the haskell layer
;; if you were using that before

;; 3. make sure you have stack installed http://haskellstack.org

;; 4. fire up emacs & open up a stack project's source files

(defconst td-haskell-packages
  '(company
    flycheck
    haskell-mode
    hindent
    (intero :location "~/git/intero/elisp"))
  yasnippet)

(defun td-haskell/init-hindent ()
  (use-package haskell-mode))

(defun td-haskell/post-init-hindent ()
  (add-hook 'haskell-mode-hook 'hindent-mode))

(defun td-haskell/post-init-company ()
  (add-hook 'haskell-mode-hook 'company-mode))

(defun td-haskell/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'haskell-mode-hook))

(defun td-haskell/init-hrefactor ()
  (use-package hrefactor))

(defun td-haskell/init-haskell-mode ()
  (use-package haskell-mode))

(defun td-haskell/pre-init-haskell-mode ()
)

(defun td-haskell/post-init-haskell-mode ()
  (bind-key "M-p"         'flycheck-previous-error haskell-mode-map)
  (bind-key "M-n"         'flycheck-next-error haskell-mode-map)
)

(defun td-haskell/init-td-haskell ()
  (use-package td-haskell))

