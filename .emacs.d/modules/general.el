;;; -*- lexical-binding: t; -*-

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<up>") 'enlarge-window)

;; Ignore linux root (/) in xml and html files
(defadvice ffap-file-at-point (after ffap-file-at-point-after-advice ())
  (if (string= ad-return-value "/")
      (setq ad-return-value nil)))
(ad-activate 'ffap-file-at-point)
;; (ad-deactivate 'ffap-file-at-point)

(ffap-bindings)

;; eww settings
(use-package eww
  :straight nil
  :after dashboard
  :hook(eww-mode . visual-fill-column-mode)    ; make eww content centered
  :config
  (setq
   browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
   shr-use-fonts  t                            ; No special fonts
   shr-use-colors t                            ; No colours
   shr-indentation 4                           ; Left-side margin
   shr-width 70                                ; Fold text to 70 columns
   eww-search-prefix "https://searx.be/?q=")   ; Use another engine for searching
  )

(provide 'general)
