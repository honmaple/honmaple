;; Time-stamp: <>
;;
;; --------------------------------------------------------------------------------
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     ycmd
     emacs-lisp
     better-defaults
     git
     version-control
     org
     markdown
     python
     c-c++
     html
     javascript
     sql
     gtags
     smex
     ranger
     syntax-checking
     (c-c++ :variables c-c++-enable-clang-support t)
     (git :variables
          git-magit-status-fullscreen t)
     (ranger :variables
             ranger-show-preview t)
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom
             shell-default-term-shell "/bin/bash")
     (syntax-checking :variables
                      flycheck-check-syntax-automatically '(save mode-enabled))
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-enable-help-tooltip nil
                      )
     (python :variables
             python-enable-yapf-format-on-save t
             python-auto-set-local-pyenv-version 'on-project-switch)
     )
   dotspacemacs-additional-packages '(vimish-fold)
   dotspacemacs-excluded-packages '(
                                    magit-gitflow
                                    orgit
                                    smeargle
                                    emoji-cheat-sheet-plus
                                    gh-md
                                    ;; auto-complete
                                    skewer-mode
                                    vi-tilde-fringe
                                    eyebrowse
                                    smooth-scrolling
                                    org-repo-todo
                                    srefactor
                                    org-download
                                    org-timer
                                    org-tree-slide
                                    git-gutter
                                    git-gutter-fringe
                                    multiple-cursors
                                    company-emoji
                                    multi-term
                                    eshell
                                    eshell-prompt-extras
                                    esh-help
                                    pytest
                                    )
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 6
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'change)
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
(setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  (setq-default evil-escape-key-sequence "jj")
  (setq-default evil-escape-delay 0.2)
  (setq evil-escape-excluded-major-modes '(dired-mode neotree-mode evil-visual-mode))
  ; (setq evil-escape-enable-only-for-major-modes 1)
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (global-set-key (kbd "C-l") 'evil-window-right)
  (global-set-key (kbd "C-h") 'evil-window-left)
  ;; (define-key evil-insert-state-map (kbd "C-h") 'evil-backward-char)
  ;; (define-key evil-insert-state-map (kbd "C-l") 'evil-forward-char)
  (define-key evil-insert-state-map (kbd "C-h") (kbd "<left>"))
  (define-key evil-insert-state-map (kbd "C-l") (kbd "<right>"))
  (define-key evil-normal-state-map (kbd "H") (kbd "^"))
  (define-key evil-normal-state-map (kbd "L") (kbd "$"))
  (define-key evil-visual-state-map (kbd "H") (kbd "^"))
  (define-key evil-visual-state-map (kbd "L") (kbd "$"))
  (define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "RET") 'er/expand-region)
  (global-set-key [f2] 'neotree-toggle)
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
  (setq python-shell-interpreter "python")
  (setq python-fill-column 79)
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'python-mode-hook 'ycmd-mode)
  (add-hook 'web-mode-hook 'ycmd-mode)
  (add-hook 'after-init-hook #'global-ycmd-mode)
  ;; (company-ycmd-setup)
  ;; (flycheck-ycmd-setup)
  (set-variable 'ycmd-server-command '("python2" "/home/jianglin/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
  ;; (set-variable 'ycmd-global-config "/home/jianglin/.emacs.d/layer/+tool/ycmd/global_config.py")
  (set-variable 'ycmd-global-config "/home/jianglin/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")
  (setq company-idle-delay 0.1)
  ;; (eval-after-load "company"
  ;;   '(add-to-list 'company-backends 'company-ycmd))
  (setq company-backends '((company-ycmd
                            company-gtags
                            company-files
                            company-yasnippet
                            ; company-gapf
                            company-dabbrev
                            company-dabbrev-code
                            company-keywords)))
  (add-hook 'python-mode-hook 'anaconda-mode)
  ;; (setq company-backends-c-mode-common '((company-c-headers
  ;;                                         company-ycmd
  ;;                                         company-dabbrev :with company-yasnippet)))
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)
  (setq powerline-default-separator 'wave)
  (setq ranger-width-parents 0.12)
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4" "rmvb""pyc" "swp"))
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq tab-width 4)
  (setq user-full-name "jianglin")
  (set-default 'truncate-lines t)
  ;; 格式化代码
  (defun indent-buffer ()
    (interactive)
    (save-excursion
      (indent-region (point-min) (point-max) nil)))
  (global-set-key [f6] 'indent-buffer)
  (add-hook 'web-mode-hook
            (lambda ()
              ;; (define-key evil-normal-state-local-map [f7] 'web-mode-fold-or-unfold)))
              (define-key evil-normal-state-local-map "za" 'web-mode-fold-or-unfold)))
  (add-hook 'python-mode-hook
            (lambda ()
              ;; (define-key evil-normal-state-local-map [f7] 'web-mode-fold-or-unfold)))
              (define-key evil-normal-state-local-map "[f5]" 'run-buffer-with-python3-interpreter)))
  (defun run-buffer-with-python3-interpreter ()
    (interactive)
    (save-buffer)
    (shell-command (format "python3 %s" (file-name-nondirectory buffer-file-name)))
    )
)
