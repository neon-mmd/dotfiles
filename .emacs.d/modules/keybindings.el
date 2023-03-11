;; keybindings
(use-package general
  :straight t
  :config
  (general-evil-setup t)

  (general-nmap
    :prefix ";g"
    "o" 'org-agenda
    "f" 'elfeed
    "c" 'neon/connect-irc
    "b" 'eww
    "e" 'emojify-insert-emoji
    "a" 'all-the-icons-insert
    "s" 'desktop-save-in-desktop-dir
    "r" 'desktop-revert
    "w" 'save-buffer
    )

  (general-nmap
    :prefix ";t"
    "v" 'vterm-other-window
    "s" 'neotree
    "f" 'ts-fold-toggle
    "a" 'ts-fold-close-all
    )

  (general-nmap
    :prefix ";l"
    "l" 'lsp-bridge-find-references
    "d" 'lsp-bridge-diagnostic-list
    "p" 'check-parens
    "f" 'format-all-buffer
    "i" 'lsp-bridge-popup-documentation
    "c" 'lsp-bridge-find-def
    )

  (general-nmap
    :prefix ";f"
    "i" 'consult-imenu
    "o" 'consult-outline
    "h" 'consult-org-heading
    "m" 'consult-minor-mode-menu
    "r" 'Consult-Ripgrep
    "s" 'consult-line
    )

  (general-def 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer
    "R" 'dired-async-do-rename
    "S" 'dired-async-do-symlink
    "C" 'dired-async-do-copy
    "H" 'dired-async-do-hardlink
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

  (general-nmap
    :prefix "gc"
    "c" 'evilnc-comment-or-uncomment-lines
    )

  (general-def 'normal
    "C-." 'embark-act
    "M-." 'embark-dwim
    "C-h B" 'embark-bindings
    "C-M-/"  'dabbrev-expand
    )
  )

(provide 'keybindings)
