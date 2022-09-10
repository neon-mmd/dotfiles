;; magit
(use-package magit
  :commands magit-status
  :straight t
  :after dashboard
  :custom((magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)) ;; open in the same window as the project
  )

;; show git signs in git projects
(use-package diff-hl
  :straight t
  :after dashboard
  :init
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  )

(provide 'git)
