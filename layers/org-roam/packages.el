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
      (spacemacs|diminish org-roam-mode " ⓡ" " r")
      )
    :hook
    ((org-mode . org-roam-mode)
     ;; (after-init . org-roam--build-cache-async) ;; optional!
     )
    :custom
    (org-roam-directory "~/org/")
    (org-roam-capture-templates
     '(("d" "default" plain (function org-roam--capture-get-point)
        "%?"
        :file-name "%<%Y%m%d%H%M%S>-${slug}"
        :head "#+TITLE: ${title}\n"
        :unnarrowed t)
       ("z" "zombie" plain (function org-roam--capture-get-point)
        "%?"
        :file-name "notes/${slug}"
        :head "#+TITLE: ${title}\n#+DRAFT: true\n#+DATE: %<%Y-%m-%d>"
        :unnarrowed t)
       ("h" "hugo" plain (function org-roam--capture-get-point)
        "%?"
        :file-name "notes/${slug}"
        :head "#+title: ${title}\n#+draft: true\n#+date: %<%Y-%m-%d>\n#+hugo_base_dir: ~/site/\n#+hugo_section: notes\n")
       ))
    (org-roam-templates
     (list (list "default" (list :file #'org-roam--file-name-title
                                 :content "#+TITLE: ${title}"))))
    :bind))

