(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" default)))
 '(dired-auto-revert-buffer t)
 '(evil-escape-key-sequence "jk")
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(haskell-font-lock-symbols t)
 '(haskell-hayoo-url "http://hayoo.fh-wedel.de/?query=%s")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle/?q=%s")
 '(haskell-indent-spaces 4)
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-starter-offset 2)
 '(haskell-indentation-where-post-offset 2)
 '(haskell-indentation-where-pre-offset 2)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ido-auto-merge-delay-time 4)
 '(org-M-RET-may-split-line (quote ((headline . t))))
 '(org-adapt-indentation nil)
 '(org-agenda-compact-blocks t)
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODO's"
      ((agenda ""
               ((org-agenda-overriding-header "today")))
       (tags "REFILE"
             ((org-agenda-overriding-header "refile me pls")
              (org-tags-match-list-sublevels nil)))
       (todo "+TODO='NEXT'" nil)
       (todo "+TODO='TODO'" nil))
      nil)
     ("z" "draft full agenda"
      ((agenda ""
               ((org-agenda-overriding-header "today")))
       (tags "REFILE"
             ((org-agenda-overriding-header "refiles")))
       (tags "TODO=\"TODO\"+SCHEDULED>\"<today>\""
             ((org-agenda-overriding-header "scheduled")))
       (tags "TODO=\"TODO\"-SCHEDULED<=\"<today>\"-SCHEDULED>\"<today>\""
             ((org-agenda-overriding-header "the rest")))
       (tags "TODO=\"DONE\""
             ((org-agenda-overriding-header "done and dusted"))))
      nil nil)
     ("x" "sandpit" tags "+SCHEDULED>=\"<2008-10-11>\"" nil))))
 '(org-agenda-diary-file (quote diary-file))
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-files
   (quote
    ("~/stuff/docs/tax/scarcetax.org" "~/stuff/sys.org" "~/stuff/stuff.org" "~/stuff/refile.org" "~/stuff/life.org" "~/stuff/emacs.org" "~/stuff/bugz.org")))
 '(org-agenda-include-diary nil)
 '(org-agenda-ndays 1)
 '(org-agenda-persistent-filter t)
 '(org-agenda-scheduled-leaders (quote ("" "S%d: ")))
 '(org-agenda-skip-additional-timestamps-same-entry t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-agenda-skip-unavailable-files t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up todo-state-up user-defined-up priority-down effort-up category-keep)
     (todo category-up priority-down effort-up)
     (tags category-up priority-down effort-up)
     (search category-keep))))
 '(org-agenda-span (quote day))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-tags-column -102)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-text-search-extra-files nil)
 '(org-agenda-use-time-grid nil)
 '(org-agenda-window-setup (quote current-window))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (sh . t)
     (dot . t)
     (org . t)
     (js . t)
     (haskell \.t))))
 '(org-babel-results-keyword "results")
 '(org-capture-bookmark nil)
 '(org-capture-templates
   (quote
    (("r" "refile" entry
      (file "~/stuff/refile.org")
      "* TODO %?
")
     ("z" "bugz" entry
      (file+headline "~/stuff/sys/bugz.org" "bugz!")
      "* TODO %?
%a"))))
 '(org-clock-clocked-in-display (quote mode-line))
 '(org-clock-idle-time 10)
 '(org-completion-use-ido t)
 '(org-confirm-babel-evaluate nil)
 '(org-confirm-elisp-link-function nil)
 '(org-crypt-disable-auto-save nil)
 '(org-crypt-key "F0B66B40")
 '(org-cycle-global-at-bob t)
 '(org-cycle-separator-lines 0)
 '(org-deadline-warning-days 5)
 '(org-default-notes-file "~/stuff/org/refile.org")
 '(org-directory "~/stuff")
 '(org-edit-src-content-indentation 0)
 '(org-enable-priority-commands nil)
 '(org-enforce-todo-dependencies t)
 '(org-entities-user
   (quote
    (("hardbreak" "\\\\" nil "" "" "" "")
     ("greytext" "\\\\color{greytext}" nil "" "" "" ""))))
 '(org-export-babel-evaluate nil)
 '(org-export-copy-to-kill-ring t)
 '(org-export-date-timestamp-format "%Y-%m-%d")
 '(org-export-html-inline-images t)
 '(org-export-html-link-home "www.scarcecapital.com")
 '(org-export-html-postamble nil)
 '(org-export-html-style "")
 '(org-export-html-style-extra "")
 '(org-export-html-style-include-default nil)
 '(org-export-html-xml-declaration
   (quote
    (("html" . "")
     ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
     ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))
 '(org-export-with-drawers nil)
 '(org-export-with-tags nil)
 '(org-export-with-timestamps nil)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-footnote-section nil)
 '(org-from-is-user-regexp "\\<tony day\\>")
 '(org-hide-leading-stars nil)
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-htmlize-output-type (quote css))
 '(org-html-postamble nil)
 '(org-insert-heading-respect-content nil)
 '(org-latex-to-pdf-process
   (quote
    ("xelatex -interaction nonstopmode -output-directory %o %f" "xetex %f")))
 '(org-link-abbrev-alist (quote (("google" . "http://www.google.com/search?q="))))
 '(org-log-done nil)
 '(org-log-into-drawer "LOGBOOK")
 '(org-modules (quote (org-id org-info)))
 '(org-outline-path-complete-in-steps nil)
 '(org-provide-todo-statistics nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path (quote file))
 '(org-remove-highlights-with-change nil)
 '(org-return-follows-link t)
 '(org-show-notification-handler (quote alert))
 '(org-src-fontify-natively t)
 '(org-src-lang-modes
   (quote
    (("plantuml" . fundamental)
     ("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("screen" . shell-script)
     ("R" . R)
     ("haskell" . haskell))))
 '(org-src-preserve-indentation t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (csv-mode hlint-refactor llvm-mode intero goto-chg undo-tree diminish company-ghci org-download eyebrowse evil-visual-mark-mode darkokai-theme column-enforce-mode pyvenv pytest pyenv-mode pip-requirements live-py-mode hy-mode helm-pydoc ein websocket cython-mode company-anaconda anaconda-mode pythonic uuidgen link-hint helm-hoogle evil-ediff f alert log4e gntp parent-mode request logito pcache pkg-info epl flx iedit pos-tip powerline hydra spinner markdown-mode s gh flycheck magit magit-popup git-commit with-editor smartparens ghc haskell-mode yasnippet avy auto-complete packed company highlight anzu gitignore-mode projectile dash helm popup helm-core async package-build bind-key bind-map evil railscasts-theme omtose-phellack-theme majapahit-theme dracula-theme zonokai-theme zenburn-theme zen-and-art-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spray spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle shm seti-theme reverse-theme restart-emacs rainbow-delimiters quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md gandalf-theme flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-leader evil-jumper evil-indent-textobject evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks elisp-slime-nav django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-quickhelp company-ghc company-cabal colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-execute-asynchronously t t)
 '(paradox-github-token "9c0337a9d7ffbfa53d06bf294278dc777a2b77c9")
 '(projectile-known-projects-file "~/.spacemacs.d/.cache/projectile-bookmarks.eld")
 '(reb-re-syntax (quote read))
 '(recentf-save-file "~/.spacemacs.d/.cache/recentf")
 '(tags-add-tables nil)
 '(tramp-persistency-file-name "~/.spacemacs.d/.cache/tramp" t)
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0)))))
 '(yas-fallback-behavior (quote call-other-command))
 '(yas-indent-line (quote nothing))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-dropdown-prompt)))
 '(yas-triggers-in-field t)
 '(yas-wrap-around-region t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
