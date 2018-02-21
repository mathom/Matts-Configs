;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     octave
     nginx
     javascript
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     ;; better-defaults
     (git :variables
          git-enable-github-support t
          git-link-use-commit t
          git-gutter-use-fringe t)
     (auto-completion :variables
          auto-completion-use-tab-instead-of-enter t)
     ;; org
     chrome
     git
     github
     go
     haskell
     html
     ;; javascript
     markdown
     ;; ocaml
     osx
     puppet
     python
     ruby
     salt
     semantic
     shell-scripts
     syntax-checking
     yaml
     salt
     ;; themes-megapack
     terraform
     markdown
     (markdown :variables
      markdown-live-preview-engine 'vmd
     )
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   dotspacemacs-default-font '("Hack"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; fix slow helm
   projectile-enable-caching t
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; Don't whine about symlinks
   vc-follow-symlinks t
   ;; Don't show some file types
   dired-omit-files-p t
   dired-omit-extensions '(".pyc")
   ;; make the scroll wheel sensible
   mouse-wheel-scroll-amount '(2 ((shift) . 1) ((control) . nil))
   mouse-wheel-progressive-speed nil
   )
  ;; User initialization goes here
  )

;;(defun run-python-once ()
;; (remove-hook 'python-mode-hook 'run-python-once)
;; (run-python))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'prog-mode-hook 'linum-mode)
  ;;(add-hook 'python-mode-hook 'run-python-once)
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  ;; (load-theme 'gruvbox t)
)

(defun what-face (pos)
 (interactive "d")
 (let ((face (or (get-char-property (point) 'read-face-name)
	      (get-char-property (point) 'face))))
  (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; Custom file types
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(custom-enabled-themes (quote (classic)))
 '(custom-safe-themes
   (quote
    ("7d364e1597a2c31537e3038ce811dab9bf51f7c7e203cdbe50b7bc65c3e86c7e" "b584a2b63b66e1b4e6ecd141a736c55d09ba9a0b1aa96f15261c612bf86afba8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "645b2e8f2f79fc1ab4d60b412394f88b44fdbb2045bee9cbd8c0da08009f1b97" "4974f680cd265a7049d7bfbb9be82e78ae97c12dd5eac0205756acc3f424f882" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(mac-mouse-wheel-smooth-scroll nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme winum pug-mode minitest insert-shebang hide-comnt go-guru fuzzy flymd ghub terraform-mode hcl-mode groovy-mode gradle-mode vmd-mode org yapfify uuidgen toc-org rake py-isort pdf-tools tablist osx-dictionary org-plus-contrib org-bullets livid-mode skewer-mode simple-httpd live-py-mode link-hint intero hlint-refactor helm-hoogle github-search eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump company-shell company-ghci column-enforce-mode mmm-jinja2 mmm-mode request html-to-markdown epl flx pythonic ws-butler window-numbering web-mode web-beautify volatile-highlights tuareg caml tagedit srefactor spaceline powerline smooth-scrolling shm sass-mode ruby-test-mode rspec-mode robe restart-emacs rainbow-delimiters pyvenv pytest puppet-mode persp-mode paradox hydra spinner page-break-lines osx-trash orgit open-junk-file ocp-indent neotree move-text merlin markdown-toc magit-gitflow magit-gh-pulls linum-relative leuven-theme less-css-mode json-mode js2-refactor multiple-cursors js2-mode js-doc jade-mode info+ indent-guide ido-vertical-mode hl-todo hindent highlight-numbers help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-make projectile helm-descbinds helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate gmail-message-mode markdown-mode github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip flycheck-haskell flycheck fish-mode expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-iedit-state iedit evil-exchange evil-escape emmet-mode company-web web-completion-data company-tern dash-functional tern company-quickhelp company-anaconda coffee-mode bundler inf-ruby buffer-move bracketed-paste auto-yasnippet yasnippet anaconda-mode aggressive-indent ace-link ace-jump-helm-line auto-complete avy ghc haskell-mode company highlight anzu gh marshal pcache ht go-mode gitignore-mode helm helm-core popup async f s dash yaml-mode quelpa package-build use-package which-key bind-map evil spacemacs-theme vi-tilde-fringe utop undo-tree stickyfunc-enhance smeargle slim-mode scss-mode salt-mode rvm ruby-tools rubocop reveal-in-osx-finder rbenv pyenv-mode py-yapf pos-tip popwin pkg-info pip-requirements pcre2el pbcopy parent-mode lorem-ipsum logito let-alist launchctl json-snatcher json-reformat hy-mode hungry-delete highlight-parentheses highlight-indentation helm-mode-manager helm-gitignore helm-flx helm-css-scss haml-mode ham-mode goto-chg golden-ratio go-eldoc github-browse-file gist gh-md flx-ido fill-column-indicator fancy-battery evil-visualstar evil-tutor evil-numbers evil-indent-plus evil-args evil-anzu eval-sexp-fu edit-server dockerfile-mode diminish define-word cython-mode company-statistics company-go company-ghc company-cabal cmm-mode clean-aindent-mode chruby bind-key auto-highlight-symbol adaptive-wrap ace-window ac-ispell)))
 '(ring-bell-function (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; '(magit-item-highlight ((t (:background "#3f5f5f")))))
