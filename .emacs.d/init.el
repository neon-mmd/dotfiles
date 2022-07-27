;; straight.el configuration 
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; integrating use-package to straight
(straight-use-package 'use-package)
(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

;; no-littering configuration
(defvar no-littering-etc-directory
  (expand-file-name "~/.config/emacs/")) 
(defvar no-littering-var-directory
      (expand-file-name "~/.config/emacs/")) 
(defvar auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
(defvar custom-file (no-littering-expand-etc-file-name "custom.el"))
 
(require 'recentf)
(add-to-list 'recentf-exclude no-littering-var-directory)
(add-to-list 'recentf-exclude no-littering-etc-directory)

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "~/.config/emacs/eln-cache/"))))

;; don't create mess in the .emacs.d folder
(use-package no-littering
  :straight t
   )

;; do garbage collection automatically in minor mode 
(use-package gcmh
  :straight t
  :custom(
	  (setq gcmh-high-cons-threshold 500000000)
	  (setq gcmh-idle-delay 0.3)
	  )
  :config
  (add-hook 'focus-out-hook 'garbage-collect)
  :init(gcmh-mode 1)
  )

;;keybindings and line-numbers 
(global-display-line-numbers-mode t)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) 

;;defining font-size and frame-transparency variables
(defvar neon/def-font-size 120)
(defvar neon/variable-pitch-font-size 120)
(defvar neon/frame-transparency '(90 . 90))

;; general ui & general configuration.
(scroll-bar-mode -1) ; disable scroll bars.
(menu-bar-mode -1) ; disable menu bars.
(tooltip-mode 0) ; disable tooltips.
(tool-bar-mode 0) ; disable toolbars.
(fringe-mode 0) ; don't show fringes.
(column-number-mode t) ; show column numbers.
(save-place-mode t) ; remember the place of last cursor position in buffers.
(global-auto-revert-mode) ; to automatically show changes in buffers.
(auto-save-mode t) ; automatically save files.
(setq tab-width 4) ; set tab-width to 4.
(setq use-dialog-box nil) ; don't show dialog boxes.
(setq visible-mode t) 
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))) ; set the initial buffer to dashboard
(setq native-comp-async-report-warnings-errors nil) ; disable compiler warnings as they are disruptive.

;; eww settings
(use-package eww
  :straight nil
  :after dashboard
  :hook(eww-mode . visual-fill-column-mode)    ; make eww content centered
  :config
  (setq
   browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
   shr-use-fonts  t                            ; No special fonts
   shr-use-colors t                            ; No colours
   shr-indentation 4                           ; Left-side margin
   shr-width 70                                ; Fold text to 70 columns
   eww-search-prefix "https://searx.be/?q=")   ; Use another engine for searching
  )

;; function to connect to erc automatically on keybinding.
(defun neon/connect-irc ()
  "function to connect to erc automatically on keybinding."
  (interactive)
  (erc-tls
   :server "irc.libera.chat"
   :port 6697
   :nick "slenderHacker"
   :password (password-store-get "erc/irc")) ;; using pass to retrieve password
  ) 

;; keybindings 
(use-package general
  :straight t
  :config
  (general-evil-setup t)

  ;; defining a new keymap prefix
  (define-prefix-command 'ring-map)
  (global-set-key (kbd "C-a") 'ring-map)
  
  (general-create-definer neon/ctrl-a-keys
    :prefix "C-a"
    )

  (neon/ctrl-a-keys
    "a" 'org-agenda
    "v" 'vterm-other-window
    "e" 'elfeed
    "c" 'neon/connect-irc
    "f" 'lsp-ui-peek-find-references
    "s" 'treemacs
    "l" 'consult-imenu
    "o" 'consult-outline
    "h" 'consult-org-heading
    "m" 'consult-minor-mode-menu
    "g" 'consult-ripgrep
    "b" 'eww
    "p" 'check-parens
    "d" 'consult-lsp-diagnostics
    "E" 'emojify-insert-emoji
    "A" 'all-the-icons-insert
    )

  (general-def 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer 
    "R" 'dired-async-do-rename
    "S" 'dired-async-do-symlink
    "C" 'dired-async-do-copy
    "H" 'dired-async-do-hardlink
    )
  
  (general-def 'normal 'company-active-map
    "<tab>" 'company-complete-selection
    )

  (general-def 'normal 'lsp-mode-map
    "<tab>" 'company-indent-or-complete-common
     )
  
  (general-create-definer neon/ctrl-x-keys
    :prefix "C-x"
    )

  (neon/ctrl-x-keys
    "C-j" 'dired-jump
    "p" 'projectile-command-map
    )

  (general-create-definer neon/ctrl-c-keys
    :prefix "C-c"
    )

  (neon/ctrl-c-keys
    "l" 'org-roam-buffer-toggle
    "f" 'org-roam-node-find
    "i" 'org-roam-node-insert
    )

  (general-def 'normal 'org-mode-map
    "C-M-i" 'completion-at-point
    )

  (general-define-key
   [remap switch-to-buffer] 'consult-buffer
   [remap describe-function]  'helpful-function
   [remap describe-command]  'helpful-command
   [remap describe-variable]  'helpful-variable
   [remap describe-key]  'helpful-key
   [remap dired-up-directory] 'dired-single-up-directory
   [remap dired-buffers] 'dired-single-buffer
   )

  (general-def 'normal
    "C-s" 'consult-line
    "C-." 'embark-act
    "M-." 'embark-dwim
    "C-h B" 'embark-bindings
    "M-/" 'evilnc-comment-or-uncomment-lines
    )
  )

;; excluding following modes from showing line numbers
(dolist (mode '(org-mode-hook
                shell-mode-hook
		eshell-mode-hook
		term-mode-hook
                treemacs-mode-hook
		vterm-mode-hook
		eww-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;display startup-time 
(defun neon/display-startup-time-n-garbage ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'neon/display-startup-time-n-garbage)

;; don't prompt in daemon for updates
(defun neon/update-in-daemon ()
  (message "updating in daemon")
  (auto-package-update-prompt-before-update nil)
  )

;; prompt in regular session for updates
(defun neon/update-in-regular()
  (message "updating in regular session")
  (auto-package-update-prompt-before-update t)
  )

;;auto-package-update configuration
(use-package auto-package-update
  :after dashboard
  :straight t
  :custom
  (auto-package-update-hide-results t)
  (auto-package-update-interval 1)
  (if (daemonp)
      neon/update-in-daemon
    neon/update-in-regular
    )
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "17:00")
  )

;; check whether daemon is running
(if (daemonp)
    (message "Loading in the daemon!")
    (message "Loading in regular Emacs!"))

(defun neon/frame-n-fonts ()
  ;; Set frame transparency
  (message "setting font-faces and frame")
  (set-frame-parameter (selected-frame) 'alpha neon/frame-transparency)
  (add-to-list 'default-frame-alist `(alpha . ,neon/frame-transparency))

  ;; setting font and sizes
  (set-face-attribute 'default nil :font "Source Code Pro" :height neon/def-font-size)
  (set-face-attribute 'variable-pitch nil :font "FiraCode Nerd Font" :height neon/variable-pitch-font-size :weight 'regular)
  (set-face-attribute 'fixed-pitch nil :font "Source Code Pro" :height neon/def-font-size)

  )

;; checking if daemon is running and then calling function accordingly
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (setq doom-modeline-icon t) ; set doom-modeline icons in daemon mode
                (with-selected-frame frame
                  (neon/frame-n-fonts)))) ; set transparency and font settings in daemon mode
  (neon/frame-n-fonts)
  )

;; doom-themes
(use-package doom-themes
  :straight t
  :config
  (setq doom-themes-enable-bold t    
        doom-themes-enable-italic t)
  (load-theme 'doom-dracula t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-tomorrow-night") 
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  )

;; evil-mode
(use-package evil
  :after dashboard
  :straight t
  :init(evil-mode 1)
  :custom
  (evil-want-keybinding nil)
  )

;; evil-collections to add evil mode everywhere
(use-package evil-collection
  :after evil
  :straight t
  :init
  (evil-collection-init)
  )

;; custom dashboard for emacs
(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
  (setq dashboard-startup-banner (expand-file-name "~/.emacs.d/emacs-logo.png"))
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-week-agenda t)
)

;; show notifications within emacs
(use-package alert
  :after dashboard
  :straight t
  :custom
  (alert-default-style 'mode-line)
  )

;; don't show all minor modes in modeline
;; instead show it as a menu
(use-package minions
  :after dashboard
  :straight t
  :init
  (minions-mode 1)
  )

;;projectile and dependency for dashboard
(use-package projectile
  :straight t
  :after dashboard
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'auto))
  ;; :bind-keymap
  ;; ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/")
    (setq projectile-project-search-path '("/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/")))
  (setq projectile-switch-project-action #'projectile-dired)
  )

;; making projectile better
(use-package consult-projectile
  :straight t
  :after projectile
  )

;; which-key
(use-package which-key
  :after dashboard
  :straight t
  :init(which-key-mode 1)
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 0)
  (setq which-key-idle-secondary-delay 0.05)
  )

;; magit
(use-package magit
  :commands magit-status
  :straight t
  :after dashboard
  :custom((magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)) ;; open in the same window as the project
  )

;;page-break-lines and dependency for dashboard
(use-package page-break-lines
  :straight t
  :after dashboard
  )

;; beacon cursor blinker
(use-package beacon
  :after dashboard
  :straight t
  :init(beacon-mode 1)
  )

;; dimmer-mode
(use-package dimmer
  :after dashboard
  :straight t
  :custom
  (dimmer-adjustment-mode :both)
  (dimmer-fraction 0.10)
  :init
  (dimmer-mode 1))

;; emojify-mode
;; to show and insert emojis.
(use-package emojify
  :straight t
  :after dashboard
  :init(emojify-mode 1)
 )

;; rainbow-mode
;; to show hex colors.
(use-package rainbow-mode
  :after dashboard
  :straight t
  :init(rainbow-mode 1)
  )

;; yasnippet code completion
(use-package yasnippet
  :after lsp
  :straight t
  )

;; dired async
(use-package async
  :straight t
  :init
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  )

;; improving dired 
(use-package dired
  :after dashboard
  :straight nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-agh --group-directories-first"))
  )
  
;; open only single dired buffer
(use-package dired-single
  :straight t
  :commands (dired dired-jump find-file)
  )

;; show icons in dired
(use-package all-the-icons-dired
  :straight t
  :hook (dired-mode . all-the-icons-dired-mode)
  )

;; prescient for selectrum
(use-package selectrum-prescient
  :straight t
  :after selectrum
  :custom
  (setq selectrum-cycle-movement t)
  :init
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1)
  )

;; selectrum -- for minimal use case and for completions
;; like ivy but lightweight
(use-package selectrum
  :straight t
  :after dashboard
  :init(selectrum-mode +1)
  )

;; get project root
(defun neon/get-projectile-project-root ()
   (when (fboundp 'projectile-project-root)
    (projectile-project-root)) 
    )

;; consult
(use-package consult
  :after dashboard
  :straight t
  :custom
  (consult-project-root-function #'neon/get-projectile-project-root)
  ;; (completion-in-region-function . #'consult-completion-in-region)
  )

;; marginalia -- to show annotations or information in minibuffers
(use-package marginalia
  :straight t
  :after dashboard
  :init
  (marginalia-mode)
  )

;; 0x0 service for sharing text
;; similar to pastebin
(use-package 0x0
  :straight t
  :after dashboard
  )

;; embark to do actions in buffers
(use-package embark
  :straight t
  :after dashboard
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  )

;; embark for consult
(use-package embark-consult
  :after dashboard
  :straight t
  )

;;helpful
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  ;; :custom
  ;; (counsel-describe-function-function #'helpful-callable)
  ;; (counsel-describe-variable-function #'helpful-variable)
  )

;;doom-modeline bar
(use-package doom-modeline
  :straight t
  :hook (after-init . doom-modeline-mode)
  :custom-face
  (mode-line ((t (:height 0.85))))
  (mode-line-inactive ((t (:height 0.85))))
  :custom
  (doom-modeline-height 15)
  (doom-modeline-bar-width 6)
  (doom-modeline-lsp t)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-irc t)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon t)
  )

;; indicate incomplete brackets and braces
(use-package rainbow-delimiters
    :hook((c-mode          
         c++-mode        
         c-or-c++-mode   
         java-mode       
         js-mode         
	 js2-mode        
         js-jsx-mode     
         typescript-mode 
         python-mode     
         web-mode       
	 html-mode       
	 sh-mode         
	 lua-mode        
	 rust-mode
	 emacs-lisp-mode
         ). rainbow-delimiters-mode)
  :after dashboard
  :straight t
  )

;; auto-complete parentheses and braces
(use-package smartparens
  :hook(prog-mode . smartparens-mode)
  :straight t
  )

;; vterm
(setq shell-file-name "/bin/fish")
(use-package vterm
  :after dashboard 
  :straight t
  :config
  (setq-local vterm-max-scrollback 5000)
 )

;; lsp
(use-package lsp-mode
  :hook ((c-mode          ; clangd
          c++-mode        ; clangd
          c-or-c++-mode   ; clangd
          java-mode       ; eclipse-jdtls
          js-mode         ; ts-ls (tsserver wrapper)
	  js2-mode        ; js    (tsserver wrapper)
          js-jsx-mode     ; ts-ls (tsserver wrapper)
          typescript-mode ; ts-ls (tsserver wrapper)
          python-mode     ; pyright
          web-mode        ; ts-ls/HTML/CSS
	  html-mode       ; hbs/html+
	  sh-mode         ; shell
	  lua-mode        ; lua-lang-server
	  rust-mode       ; rls
          ) . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  ;;(setq gc-cons-threshold 100000000)
  (setq lsp-idle-delay 0.5)
  )

;; lsp-ui
(use-package lsp-ui
  :straight t
  :hook(lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-mode 0)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-mode 1)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions nil)
  )

;;treemacs
(use-package lsp-treemacs
  :straight t
   :hook(lsp-mode . lsp-treemacs-sync-mode)
   )

;;lsp ivy integration
(use-package consult-lsp
  :straight t
  :after lsp
  )

;; adding yasnippet as a company backend
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

;; company mode completion
(use-package company-lsp
  :straight t
  :after lsp
  :hook (lsp-mode . company-mode)
  :custom(
	  (company-minimum-prefix-length 1)
	  (company--idle-delay 0.0)
	  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
  )

;; make company-ui better
(use-package company-box
  :straight t
   :hook(company-mode . company-box-mode)
   )

;; make company remember recent and frequently used completion
(use-package company-prescient
  :straight t
  :after company
  :init
  (company-prescient-mode +1)
  )

;; on the flychecking for errors
(use-package flycheck
  :straight t
   :after lsp-mode
   :hook(lsp-mode . flycheck-mode)
   )

;; yasnippet-snippets
(use-package yasnippet-snippets
  :after lsp
  :straight t
  )

;; yasnippet code completion
 (use-package yasnippet
   :hook(lsp-mode . yas-minor-mode)
   :straight t
   :config
   (yas-reload-all)
   )

;; comment out lines using M-/
(use-package evil-nerd-commenter
  :after evil
  )

;; emacs-lisp-mode and company
(use-package emacs-lisp-mode
  :straight nil
  :hook(emacs-lisp-mode . company-mode)
  )

;; lsp language servers
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(use-package lsp-java
  :straight t
   :hook(java-mode-hook . lsp))

;; extra language modes in emacs
(use-package rust-mode
  :straight t
  :after dashboard
  )

(use-package lua-mode
  :straight t
  :after dashboard
  )

;; elfeed to read rss feeds
(use-package elfeed
  :commands elfeed
  :straight t
  :init (elfeed-update)
  )

;; Entries older than 1 weeks are marked as read
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "1 weeks ago"
                              :remove 'unread))

;; elfeed-org to enhance elfeed
(use-package elfeed-org
  :hook(elfeed . elfeed-org)
  :straight t
  :custom((rmh-elfeed-org-files (list "~/rss-feeds/elfeed.org")))
  )

;; elfeed-goodies to further enhance elfeed
(use-package elfeed-goodies
  :after dashboard
  :straight t
  :init (elfeed-goodies/setup)
  )

;; Erc to chat on irc
(use-package erc
  :straight nil
  :commands erc-tls 
  :config
  
  ;; basic configuration
  (setq erc-server "irc.libera.chat"
	erc-nick "slenderHacker"    ;; <---- please make sure to change this
	erc-user-full-name "Legit User"  ;; <---- And this as well
	erc-track-shorten-start 8
	erc-autojoin-channels-alist '(("irc.libera.chat" "#systemcrafters" "#emacs"))
	erc-kill-buffer-on-part t
	erc-auto-query 'bury)

  ;; add padding to erc chat to right and left
  (setq erc-fill-column 120
	erc-fill-function 'erc-fill-static
	erc-fill-static-center 20)

  ;; hide distractions in erc
  (setq erc-track-exclude '("#emacs")
	erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "AWAY")
	erc-hide-list '("JOIN" "NICK" "QUIT" "MODE" "AWAY" "PART")
	erc-track-exclude-server-buffer t)

  ;; Only use the selected frame for visibility
  (setq erc-track-visibility nil)

  ;; highlight pal names, fool names and specific words
  (setq erc-pals '("#acwd")
        erc-fools '()
        erc-keywords '("slenderHacker" "python" "c++" "c" "java" "javascript" "html" "css" "lua" "nodejs" "sqlite" "rust"))
  
  ;; show notifications when someone mentions my name
  ;; (add-to-list 'erc-modules 'notifications)

  ;; enable keybindings to switch between erc buffers
  (setq erc-track-enable-keybindings t)
  )

;; highlight people's nick name in different colors to differentiate between them
(use-package erc-hl-nicks
  :straight t
  :after erc
  :config
  (add-to-list 'erc-modules 'hl-nicks)
  )

;; show images in erc chat
(use-package erc-image
  :straight t
  :after erc
  :config
  (setq erc-image-inline-rescale 300)
  (add-to-list 'erc-modules 'image)
  )

;; show emoji icons in erc chat
(use-package emojify
  :straight t
  :hook (erc-mode . emojify-mode)
  ;; :commands emojify-mode
  )

;; visulise color with rainbow-mode
(use-package rainbow-mode
  :hook((c-mode          
         c++-mode        
         c-or-c++-mode   
         java-mode       
         js-mode         
	 js2-mode        
         js-jsx-mode     
         typescript-mode 
         python-mode     
         web-mode       
	 html-mode       
	 sh-mode         
	 lua-mode        
	 rust-mode
	 emacs-lisp-mode
         ). rainbow-mode)
  :straight t
  :after dashboard
  )

;; password management with pass
(use-package pass
  :straight t
  :after dashboard
  )

;; to enable acessing of password from pass.
(use-package auth-source-pass
  :straight t
  :after dashboard
  :config
  (auth-source-pass-enable)
  )

;; setting required settings for pass
(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)

;; integrating emacs with pass
(setq auth-sources '(password-store))

;; org-configuration
(defun neon/org-config ()
  ;; replacing org-list symbol '.' with arrows 
  (font-lock-add-keywords
 'org-mode
 '(("^[[:space:]]*\\(-\\) "
    0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "➞")))))

  ;; Set faces for heading levels.
  ;; rainbow colored headings with different colored heading
  ;; and font weights
  ;; to make them visually distinguishable.
  ;; colors referenced from rainbow-delimiters.el.
  (dolist
      (face
       '(
	 (org-level-1 1.7 "#707183" ultra-bold)
         (org-level-2 1.6 "#7388d6" extra-bold)
         (org-level-3 1.5 "#909183" bold)
         (org-level-4 1.4 "#709870" semi-bold)
         (org-level-5 1.3 "#907373" normal)
         (org-level-6 1.2 "#6276ba" normal)
         (org-level-7 1.1 "#858580" normal)
         (org-level-8 1.0 "#80a880" normal)
	 ))
    (set-face-attribute (nth 0 face) nil :font "Ubuntu" :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face))
    )

  ;; Ensuring that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)
  )

;; org
(use-package org
  :after dashboard
  :straight t  ; required to update the package 
  :hook
  (org-mode . visual-line-mode)
  (org-mode . org-indent-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . neon/org-config)
  :custom
  (org-ellipsis " ▾")
  (org-startup-with-inline-images t)
  (org-hide-emphasis-markers t)
  (org-agenda-files '("~/sheduledTasks/tasks.org"))
)

;; making heading look fancier and elegant using org-bullets.
(use-package org-bullets
  :straight t
  :hook(org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("❂" "☢" "⊗" "✪" "⦾" "⦿" "•" "∙"))
  )

;; making org content centered to give document style look.
(use-package visual-fill-column
  :straight t
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-width 100)
  (visual-fill-column-center-text t)
  :init
  (visual-fill-column-mode 1)
  )

;; adding completion templates in org for productivity
;; and efficiency.
(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (python . t)
        (java . t)
        (shell . t)
        (css . t)
        (js . t)
        (lua . t)
	))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))        ; bash template
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))   ; elisp template
  (add-to-list 'org-structure-template-alist '("py" . "src python"))       ; python template
  (add-to-list 'org-structure-template-alist '("txt" . "src text"))        ; text template
  (add-to-list 'org-structure-template-alist '("java" . "src java"))       ; java template
  (add-to-list 'org-structure-template-alist '("html" . "src html"))       ; html template
  (add-to-list 'org-structure-template-alist '("js" . "src javascript"))   ; javascript template
  (add-to-list 'org-structure-template-alist '("rs" . "src rust"))         ; rust template
  (add-to-list 'org-structure-template-alist '("c++" . "src c++"))         ; c++ template
  (add-to-list 'org-structure-template-alist '("lua" . "src lua"))         ; lua template
  (add-to-list 'org-structure-template-alist '("css" . "src css"))         ; css template
  )

;; org roam to manage project notes
(use-package org-roam
  :straight t
  :demand t ; to ensure it is loaded by default
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/OrgRoamNotes")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(
     ("d" "default" plain
      "%?"
      :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n#+Author: destruct\n#+category: ${title}\n#+date: %U\n")
      :unnarrowed t)

     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Task List\n\n* Dates\n\n"
      :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n#+filetags: Project\n#+category: ${title}\n#+Author: destruct\n#+date: %U\n")
      :unnarrowed t)
     )
   )
  :config
  (org-roam-setup)
  )
