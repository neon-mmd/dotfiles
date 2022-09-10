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
  :init(gcmh-mode 1)
  )

(provide 'cnl)
