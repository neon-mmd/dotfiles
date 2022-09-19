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
  (setq dashboard-startup-banner (expand-file-name "~/.emacs.d/banners/emacs-logo.txt"))
  (setq dashboard-banner-logo-title "Not a Deodorant 😀!!!")
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-week-agenda t)
  (setq dashboard-set-footer t)
  (setq dashboard-footer-icon "🪐 ")
  (setq dashboard-set-init-info t)
  (setq dashboard-init-info "Not a Deodorant 😀!!!")
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

;; marginalia -- to show annotations or information in minibuffers
(use-package marginalia
  :straight t
  :after dashboard
  :init
  (marginalia-mode)
  )

;; show icons in dired
(use-package all-the-icons-dired
  :straight t
  :hook (dired-mode . all-the-icons-dired-mode)
  )

;; don't show all minor modes in modeline
;; instead show it as a menu
(use-package minions
  :after dashboard
  :straight t
  :init
  (minions-mode 1)
  )

;; show notifications within emacs
(use-package alert
  :after dashboard
  :straight t
  :custom
  (alert-default-style 'mode-line)
  )

(provide 'aesthetics)
