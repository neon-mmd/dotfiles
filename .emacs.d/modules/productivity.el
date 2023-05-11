;;; -*- lexical-binding: t; -*-

;; auto-package-update configuration
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
  (when (file-directory-p "/run/media/destruct/projects/git-repos/")
    (setq projectile-project-search-path '("/run/media/destruct/projects/git-repos/")))
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

;; dired async
(use-package async
  :straight t
  :init
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
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

;; consult
(use-package consult
  :after dashboard
  :straight t
  :custom
  (consult-project-root-function #'neon/get-projectile-project-root)
  ;; (completion-in-region-function . #'consult-completion-in-region)
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

;; save sessions in emacs
(use-package desktop
  :straight nil
  :config
  (when (not (file-directory-p "~/.config/emacs/desktop/"))
      (make-directory "~/.config/emacs/desktop/" t)
      )
  (setq desktop-dirname "~/.config/emacs/desktop/")
  )

(provide 'productivity)
