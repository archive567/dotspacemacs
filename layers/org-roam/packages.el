(defconst org-roam-packages
  '((org-roam :location (recipe :fetcher github :repo "jethrokuan/org-roam" :branch "develop"))))

(defun org-roam/init-org-roam ()
  (use-package org-roam
    :after org
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "rr" 'org-roam
        "rt" 'org-roam-today
        "rf" 'org-roam-find-file
        "ri" 'org-roam-insert
        "rg" 'org-roam-show-graph
        )
      )
    :hook
    ((org-mode . org-roam-mode)
     ;; (after-init . org-roam--build-cache-async) ;; optional!
     )
    :custom
    (org-roam-directory "~/org/")
    (org-roam-templates
     (list (list "default" (list :file #'org-roam--file-name-title
                                 :content "#+TITLE: ${title}"))))
    :bind))

