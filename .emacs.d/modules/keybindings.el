;; keybindings
(use-package general
  :straight t
  :config
  (general-evil-setup t)

  ;; defining a new keymap prefix "Ctrl+a"
  (global-unset-key "\C-a")
  (defvar ctl-a-map (make-keymap)
    "Keymap for local bindings and functions, prefixed by (^A)")
  (define-key global-map "\C-a" 'Control-A-prefix)
  (fset 'Control-A-prefix ctl-a-map)

  ;; defining a new keymap prefix "Ctrl+t"
  (global-unset-key "\C-q")
  (defvar ctl-q-map (make-keymap)
    "Keymap for local bindings and functions, prefixed by (^Q)")
  (define-key global-map "\C-q" 'Control-Q-prefix)
  (fset 'Control-Q-prefix ctl-q-map)

  ;; defining a new keymap prefix "Ctrl+l"
  (global-unset-key "\C-l")
  (defvar ctl-l-map (make-keymap)
    "Keymap for local bindings and functions, prefixed by (^L)")
  (define-key global-map "\C-l" 'Control-L-prefix)
  (fset 'Control-L-prefix ctl-l-map)

  ;; defining a new keymap prefix "Ctrl+f"
  (global-unset-key "\C-j")
  (defvar ctl-j-map (make-keymap)
    "Keymap for local bindings and functions, prefixed by (^J)")
  (define-key global-map "\C-j" 'Control-J-prefix)
  (fset 'Control-J-prefix ctl-j-map)

  (general-create-definer neon/ctrl-a-keys
    :prefix "C-a"
    )

  (neon/ctrl-a-keys
    "o" 'org-agenda
    "f" 'elfeed
    "c" 'neon/connect-irc
    "b" 'eww
    "e" 'emojify-insert-emoji
    "a" 'all-the-icons-insert
    "s" 'desktop-save-in-desktop-dir
    "r" 'desktop-revert
    )

  (general-create-definer neon/ctrl-q-keys
    :prefix "C-q"
    )

  (neon/ctrl-q-keys
    "v" 'vterm-other-window
    "s" 'treemacs
    )

  (general-create-definer neon/ctrl-l-keys
    :prefix "C-l"
    )

  (neon/ctrl-l-keys
    "l" 'lsp-ui-peek-find-references
    "d" 'consult-lsp-diagnostics
    "p" 'check-parens
    "f" 'format-all-buffer
    "i" 'lsp-ui-doc-glance
    "c" 'lsp-find-definition
    )

  (general-create-definer neon/ctrl-j-keys
    :prefix "C-j"
    )

  (neon/ctrl-j-keys
    "i" 'consult-imenu
    "o" 'consult-outline
    "h" 'consult-org-heading
    "m" 'consult-minor-mode-menu
    "r" 'Consult-Ripgrep
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

  (general-def 'insert 'corfu-map
    "<tab>" 'corfu-next
    "<return>" 'corfu-insert
    )

  (general-def 'normal 'corfu-map
    "C-u" 'corfu-doc-scroll-up
    "C-d" 'corfu-doc-scroll-down
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
   [remap corfu-show-documentation] 'corfu-doc-toggle
   )

  (general-def 'normal
    "C-s" 'consult-line
    "C-." 'embark-act
    "M-." 'embark-dwim
    "C-h B" 'embark-bindings
    "M-/" 'evilnc-comment-or-uncomment-lines
    "C-M-/"  'dabbrev-expand
    )
  )

(provide 'keybindings)
