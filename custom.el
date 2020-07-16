(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" default)))
 '(dired-auto-revert-buffer t)
 '(evil-escape-key-sequence "jk")
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(flycheck-hlintrc nil)
 '(flycheck-pos-tip-mode nil)
 '(haskell-font-lock-symbols t)
 '(haskell-hayoo-url "http://hayoo.fh-wedel.de/?query=%s")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle/?q=%s")
 '(haskell-indent-spaces 2)
 '(haskell-indentation-layout-offset 2)
 '(haskell-indentation-left-offset 2)
 '(haskell-indentation-starter-offset 2)
 '(haskell-indentation-where-post-offset 2)
 '(haskell-indentation-where-pre-offset 2)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ido-auto-merge-delay-time 4)
 '(lsp-response-timeout 120)
 '(org-startup-indented t)
 '(org-bullets-bullet-list '(" "))
 '(org-ellipsis " □ ")
 '(org-pretty-entities t)
 '(org-hide-emphasis-markers t)
 '(org-agenda-block-separator "")
 '(org-fontify-whole-heading-line t)
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
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
    ("~/org")))
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
     (shell . t)
     (dot . t)
     (org . t)
     (js . t)
     (haskell \.t))))
 '(org-babel-results-keyword "results")
 '(org-capture-bookmark nil)
 '(org-capture-templates
   (quote
    (("r" "refile" entry
      (file "~/org/refile.org")
      "* TODO %?
")
     ("z" "bugz" entry
      (file+headline "~/org/bugz.org" "bugz!")
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
 '(org-edit-src-content-indentation 0)
 '(org-enable-priority-commands nil)
 '(org-enforce-todo-dependencies t)
 '(org-entities-user
   (quote
    (("hardbreak" "\\\\" nil "" "" "" "")
     ("greytext" "\\\\color{greytext}" nil "" "" "" ""))))
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
 '(org-export-use-babel nil)
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
 '(org-image-actual-width nil)
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
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (lsp-ui lsp-haskell tidal multiple-cursors hasky-extensions idris-mode prop-menu zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox spinner osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide hydra hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode request-deferred websocket request deferred js2-mode simple-httpd dumb-jump f s dracula-theme django-theme diminish diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup farmhouse-theme)))
 '(paradox-automatically-star t)
 '(paradox-execute-asynchronously t t)
 '(paradox-github-token "9c0337a9d7ffbfa53d06bf294278dc777a2b77c9")
 '(projectile-known-projects-file "~/.emacs.d/.cache/projectile-bookmarks.eld")
 '(reb-re-syntax (quote read))
 '(recentf-save-file "~/.emacs.d/.cache/recentf")
 '(tags-add-tables nil)
 '(tramp-persistency-file-name "~/.emacs.d/.cache/tramp" t)
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
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" default)))
 '(deft-file-naming-rules
    (quote
     ((noslash . "-")
      (nospace . "-")
      (case-fn . downcase))))
 '(deft-strip-summary-regexp "\\([
	]\\|^#\\+.+:.*$\\)")
 '(delete-by-moving-to-trash nil)
 '(dired-auto-revert-buffer t)
 '(ess-default-style (quote DEFAULT))
 '(ess-style (quote DEFAULT))
 '(evil-escape-key-sequence "jk")
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoctor asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3 erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-megacheck go-staticcheck groovy haml handlebars haskell-dante haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(flycheck-haskell-stack-ghc-executable "/Users/tonyday/.local/bin/stack")
 '(flycheck-hlintrc nil)
 '(flycheck-lintr-linters
   "with_defaults(object_usage_linter = NULL, object_name_linter = NULL, snake_case_linter = NULL, camel_case_linter = NULL)")
 '(flycheck-pos-tip-mode nil)
 '(flymake-no-changes-timeout 10)
 '(flymake-start-syntax-check-on-newline nil)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-font-lock-symbols t)
 '(haskell-hayoo-url "http://hayoo.fh-wedel.de/?query=%s")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle/?q=%s")
 '(haskell-indent-spaces 2)
 '(haskell-indentation-layout-offset 2)
 '(haskell-indentation-left-offset 2)
 '(haskell-indentation-starter-offset 2)
 '(haskell-indentation-where-post-offset 2)
 '(haskell-indentation-where-pre-offset 2)
 '(haskell-interactive-mode-eval-mode (quote ignore))
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-show-overlays nil)
 '(haskell-process-suggest-add-package nil)
 '(haskell-process-suggest-haskell-docs-imports nil)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-restart nil)
 '(haskell-svg-render-images t)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ido-auto-merge-delay-time 4)
 '(js2-strict-missing-semi-warning nil)
 '(line-spacing 0.1)
 '(lsp-response-timeout 120)
 '(lsp-ui-doc-position (quote bottom))
 '(markdown-command
   "pandoc --from markdown -t html --mathjax --highlight-style pygments --standalone")
 '(org-M-RET-may-split-line (quote ((headline . t))))
 '(org-adapt-indentation nil)
 '(org-agenda-block-separator "")
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
    ("~/org/box-socket.org" "/Users/tonyday/org/algebra.org" "/Users/tonyday/org/bugz.org" "/Users/tonyday/org/case.org" "/Users/tonyday/org/chart-svg.org" "/Users/tonyday/org/ephemeral.org" "/Users/tonyday/org/ib.org" "/Users/tonyday/org/interactive-print.org" "/Users/tonyday/org/iqfeed.org" "/Users/tonyday/org/library-checklist.org" "/Users/tonyday/org/life.org" "/Users/tonyday/org/lifta2state.org" "/Users/tonyday/org/numhask-prelude.org" "/Users/tonyday/org/online-market.org" "/Users/tonyday/org/refile.org" "/Users/tonyday/org/revolution.org" "/Users/tonyday/org/sys.org" "/Users/tonyday/org/web-rep.org")))
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
     (shell . t)
     (dot . t)
     (org . t)
     (js . t)
     (haskell \.t))))
 '(org-babel-results-keyword "results")
 '(org-bullets-bullet-list (quote (" ")))
 '(org-capture-bookmark nil)
 '(org-capture-templates
   (quote
    (("r" "refile" entry
      (file "~/org/refile.org")
      "* TODO %?
")
     ("z" "bugz" entry
      (file+headline "~/org/bugz.org" "bugz!")
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
 '(org-edit-src-content-indentation 0)
 '(org-ellipsis " □ ")
 '(org-enable-priority-commands nil)
 '(org-enforce-todo-dependencies t)
 '(org-entities-user
   (quote
    (("hardbreak" "\\\\" nil "" "" "" "")
     ("greytext" "\\\\color{greytext}" nil "" "" "" ""))))
 '(org-export-backends (quote (ascii html latex md)))
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
 '(org-export-use-babel nil)
 '(org-export-with-drawers nil)
 '(org-export-with-tags nil)
 '(org-export-with-timestamps nil)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-footnote-section nil)
 '(org-from-is-user-regexp "\\<tony day\\>")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars nil)
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-htmlize-output-type (quote css))
 '(org-html-postamble nil)
 '(org-image-actual-width nil)
 '(org-insert-heading-respect-content nil)
 '(org-latex-to-pdf-process
   (quote
    ("xelatex -interaction nonstopmode -output-directory %o %f" "xetex %f")))
 '(org-link-abbrev-alist (quote (("google" . "http://www.google.com/search?q="))))
 '(org-link-elisp-confirm-function nil)
 '(org-link-from-user-regexp "\\<tony day\\>")
 '(org-log-done nil)
 '(org-log-into-drawer "LOGBOOK")
 '(org-modules (quote (org-id org-info)))
 '(org-outline-path-complete-in-steps nil)
 '(org-pomodoro-format "%s")
 '(org-pretty-entities t)
 '(org-provide-todo-statistics nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path (quote file))
 '(org-remove-highlights-with-change nil)
 '(org-return-follows-link t)
 '(org-roam-directory "~/org/" nil nil "Customized with use-package org-roam")
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
 '(org-todo-keywords (quote ((sequence "TODO" "DONE" "BLOCKED"))))
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (lsp-ui lsp-haskell tidal multiple-cursors hasky-extensions idris-mode prop-menu zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox spinner osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide hydra hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode request-deferred websocket request deferred js2-mode simple-httpd dumb-jump f s dracula-theme django-theme diminish diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup farmhouse-theme)))
 '(paradox-automatically-star t)
 '(paradox-execute-asynchronously t t)
 '(paradox-github-token "9c0337a9d7ffbfa53d06bf294278dc777a2b77c9")
 '(powerline-default-separator (quote arrow))
 '(projectile-known-projects-file "~/.emacs.d/.cache/projectile-bookmarks.eld")
 '(reb-re-syntax (quote read))
 '(recentf-save-file "~/.emacs.d/.cache/recentf")
 '(tags-add-tables nil)
 '(tramp-persistency-file-name "~/.emacs.d/.cache/tramp")
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
