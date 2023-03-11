;; excluding following modes from showing line numbers
(dolist (mode '(org-mode-hook
                shell-mode-hook
		eshell-mode-hook
		term-mode-hook
                treemacs-mode-hook
		vterm-mode-hook
		eww-mode-hook
		neotree-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'emacs-startup-hook #'neon/display-startup-time-n-garbage)
(add-hook 'focus-out-hook 'garbage-collect)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Entries older than 1 weeks are marked as read
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "1 weeks ago"
			      :remove 'unread))

(add-hook 'vterm-exit-functions
	  (lambda (_ _)
	    (let* ((buffer (current-buffer))
		   (window (get-buffer-window buffer)))
              (when (not (one-window-p))
		(delete-window window))
              (kill-buffer buffer)))
	  )

(provide 'hooks)
