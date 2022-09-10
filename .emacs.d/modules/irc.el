;; Erc to chat on irc
(use-package erc
  :straight nil
  :commands erc-tls
  :config

  ;; basic configuration
  (setq erc-server "irc.libera.chat"
	erc-nick "slenderHacker"    ;; <---- please make sure to change this
	erc-user-full-name "Legit User"  ;; <---- And this as well
	erc-track-shorten-start 8
	erc-autojoin-channels-alist '(("irc.libera.chat" "#systemcrafters" "#emacs"))
	erc-kill-buffer-on-part t
	erc-auto-query 'bury)

  ;; add padding to erc chat to right and left
  (setq erc-fill-column 120
	erc-fill-function 'erc-fill-static
	erc-fill-static-center 20)

  ;; hide distractions in erc
  (setq erc-track-exclude '("#emacs")
	erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "AWAY")
	erc-hide-list '("JOIN" "NICK" "QUIT" "MODE" "AWAY" "PART")
	erc-track-exclude-server-buffer t)

  ;; Only use the selected frame for visibility
  (setq erc-track-visibility nil)

  ;; highlight pal names, fool names and specific words
  (setq erc-pals '("#acwd")
        erc-fools '()
        erc-keywords '("slenderHacker" "python" "c++" "c" "java" "javascript" "html" "css" "lua" "nodejs" "sqlite" "rust"))

  ;; show notifications when someone mentions my name
  ;; (add-to-list 'erc-modules 'notifications)

  ;; enable keybindings to switch between erc buffers
  (setq erc-track-enable-keybindings t)
  )

;; highlight people's nick name in different colors to differentiate between them
(use-package erc-hl-nicks
  :straight t
  :after erc
  :config
  (add-to-list 'erc-modules 'hl-nicks)
  )

;; show images in erc chat
(use-package erc-image
  :straight t
  :after erc
  :config
  (setq erc-image-inline-rescale 300)
  (add-to-list 'erc-modules 'image)
  )

;; show emoji icons in erc chat
(use-package emojify
  :straight t
  :hook (erc-mode . emojify-mode)
  ;; :commands emojify-mode
  )

(provide 'irc)
