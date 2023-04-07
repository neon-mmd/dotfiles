;;; -*- lexical-binding: t; -*-

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

(provide 'password)
