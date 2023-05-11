;;; -*- lexical-binding: t; -*-

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

;;display startup-time
(defun neon/display-startup-time-n-garbage ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))


;; don't prompt in daemon for updates
(defun neon/update-in-daemon ()
  (message "updating in daemon")
  (auto-package-update-prompt-before-update nil)
  (auto-package-update-now-async)
  )

;; prompt in regular session for updates
(defun neon/update-in-regular()
  (message "updating in regular session")
  (auto-package-update-prompt-before-update t)
  (auto-package-update-now-async)
  )

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
	 (org-level-1 1.7 "#707183" extra-bold)
         (org-level-2 1.6 "#7388d6" bold)
         (org-level-3 1.5 "#909183" normal)
         (org-level-4 1.4 "#709870" light)
         (org-level-5 1.3 "#907373" light)
         (org-level-6 1.2 "#6276ba" light)
         (org-level-7 1.1 "#858580" light)
         (org-level-8 1.0 "#80a880" light)
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

;; get project root
(defun neon/get-projectile-project-root ()
  (when (fboundp 'projectile-project-root)
    (projectile-project-root))
  )

(provide 'functions)
