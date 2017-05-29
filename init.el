;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     helm
     emacs-lisp
     git
     github
     (haskell
      :variables
      haskell-completion-backend 'intero
      )
     td-haskell
     markdown
     org
     org-ext
     themes-megapack
     syntax-checking
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(intero)

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     gnus
     ox-pandoc
     helm-flycheck
     flycheck-pos-tip
     evil-unimpaired
     haskell-cabal
     yasnippet
     ggtags
     haskell-snippets
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((projects . 10) agenda)
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(farmhouse-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; fixme: add to haskell-ext
  (bind-key* "M-n" 'flycheck-next-error)
  (bind-key* "M-p" 'flycheck-previous-error)
  ;; (spacemacs/add-flycheck-hook 'literate-haskell-mode)

  (evil-leader/set-key
    "wa" 'default-frame
    "wA" 'max-frame
    "we" 'default-right-frame
    "wT" 'toggle-frame-size)

  (defun default-frame ()
    (interactive)
    (cond
     ((string-equal system-type "windows-nt") ; Microsoft Windows
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 10)
        (set-frame-parameter (selected-frame) 'left 6)
        (set-frame-parameter (selected-frame) 'height 60)
        (set-frame-parameter (selected-frame) 'width 120)))
     ((string-equal system-type "darwin") ; Mac OS X
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 20)
        (set-frame-parameter (selected-frame) 'left 1)
        (set-frame-parameter (selected-frame) 'height 47)
        (set-frame-parameter (selected-frame) 'width 85)))
     ((string-equal system-type "gnu/linux") ; linux
      (progn
        (message "Linux")))))

  (defun default-right-frame ()
    (interactive)
    (cond
     ((string-equal system-type "windows-nt") ; Microsoft Windows
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 10)
        (set-frame-parameter (selected-frame) 'left 2000)
        (set-frame-parameter (selected-frame) 'height 60)
        (set-frame-parameter (selected-frame) 'width 120)))
     ((string-equal system-type "darwin") ; Mac OS X
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 20)
        (set-frame-parameter (selected-frame) 'left 735)
        (set-frame-parameter (selected-frame) 'height 47)
        (set-frame-parameter (selected-frame) 'width 85)))
     ((string-equal system-type "gnu/linux") ; linux
      (progn
        (message "Linux")))))

  (defun max-frame ()
    (interactive)
    (if t
        (progn
          (set-frame-parameter (selected-frame) 'fullscreen 'fullboth)
          (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
          (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil))
      (set-frame-parameter (selected-frame) 'top 26)
      (set-frame-parameter (selected-frame) 'left 2)
      (set-frame-parameter (selected-frame) 'width
                           (floor (/ (float (x-display-pixel-width)) 9.15)))
      (if (= 1050 (x-display-pixel-height))
          (set-frame-parameter (selected-frame) 'height
                               (if (>= emacs-major-version 24)
                                   66
                                 55))
        (set-frame-parameter (selected-frame) 'height
                             (if (>= emacs-major-version 24)
                                 75
                               64)))))

  (defun toggle-frame-size ()
    (interactive)
    (if (> (cdr (assq 'width (frame-parameters))) 100)
        (min-frame)
      (max-frame)))

  (default-frame)

  ;; fixme
  (setenv "PATH"
          (concat
           (getenv "PATH")
           ";C:\\Users\\ajdayz\\AppData\\Local\\Programs\\Git\\usr\\bin")))

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
    ("~/git/org/sys.org" "~/git/org/stuff.org" "~/git/org/refile.org" "~/git/org/life.org" "~/git/org/emacs.org" "~/git/org/bugz.org" "~/git/org/work.org")))
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
      (file "~/git/org/refile.org")
      "* TODO %?
")
     ("z" "bugz" entry
      (file+headline "~/git/org/sys/bugz.org" "bugz!")
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
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zenburn-theme yaml-mode ws-butler window-numbering which-key volatile-highlights use-package ujelly-theme twilight-anti-bright-theme toc-org tao-theme tango-plus-theme spacemacs-theme spaceline powerline smeargle seti-theme restart-emacs planet-theme phoenix-dark-pink-theme persp-mode pcre2el paradox spinner orgit org organic-green-theme org-projectile org-pomodoro alert org-plus-contrib org-download open-junk-file omtose-phellack-theme noctilux-theme neotree naquadah-theme move-text monokai-theme moe-theme minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow magit-gh-pulls macrostep link-hint jazz-theme intero inkpot-theme info+ indent-guide hydra hungry-delete htmlize hl-todo hindent highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-make projectile helm-hoogle helm-descbinds helm-company helm-c-yasnippet helm-ag gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate github-search github-clone gitconfig-mode git-timemachine git-messenger git-link gist gh marshal pcache ht flatui-theme eyebrowse expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-iedit-state iedit evil-exchange evil-escape evil-ediff dumb-jump dracula-theme darktooth-theme autothemer darkokai-theme cyberpunk-theme company-statistics column-enforce-mode color-theme-sanityinc-tomorrow clues-theme bind-key badwolf-theme auto-yasnippet auto-compile apropospriate-theme anti-zenburn-theme ample-theme alect-themes aggressive-indent ace-window ace-link ace-jump-helm-line avy auto-complete ghc company highlight anzu smartparens bind-map f s evil undo-tree haskell-mode flycheck dash yasnippet request helm helm-core popup async farmhouse-theme zonokai-theme zen-and-art-theme vi-tilde-fringe uuidgen underwater-theme twilight-theme twilight-bright-theme tronesque-theme toxi-theme tangotango-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme sourcerer-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme reverse-theme rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin pkg-info phoenix-dark-mono-theme pastels-on-dark-theme parent-mode packed org-present org-bullets oldlace-theme occidental-theme obsidian-theme niflheim-theme mustang-theme monochrome-theme molokai-theme mmm-mode lush-theme lorem-ipsum logito log4e linum-relative light-soap-theme jbeans-theme ir-black-theme ido-vertical-mode hlint-refactor highlight-parentheses hide-comnt heroku-theme hemisu-theme helm-purpose helm-mode-manager helm-gitignore helm-flx hc-zenburn-theme haskell-snippets goto-chg golden-ratio gnuplot gntp github-browse-file gitattributes-mode gh-md gandalf-theme flycheck-pos-tip flycheck-haskell flx-ido flatland-theme firebelly-theme fill-column-indicator fancy-battery evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-numbers evil-lisp-state evil-indent-plus evil-args evil-anzu eval-sexp-fu espresso-theme elisp-slime-nav django-theme diminish define-word darkmine-theme darkburn-theme dakrone-theme company-ghci company-ghc company-cabal color-theme-sanityinc-solarized cmm-mode clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme auto-highlight-symbol ample-zen-theme afternoon-theme adaptive-wrap ac-ispell)))
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
)
