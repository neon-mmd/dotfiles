;; vterm
(setq shell-file-name "/bin/fish")
(use-package vterm
  :after dashboard
  :straight t
  :config
  (setq-local vterm-max-scrollback 5000)
  )

(provide 'terminal)
