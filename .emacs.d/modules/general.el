;;;defining font-size and frame-transparency variables
(defvar neon/def-font-size 120)
(defvar neon/variable-pitch-font-size 120)
(defvar neon/frame-transparency '(90 . 90))

;; check whether daemon is running
(if (daemonp)
    (message "Loading in the daemon!")
  (message "Loading in regular Emacs!"))

;; checking if daemon is running and then calling function accordingly
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (setq doom-modeline-icon t) ; set doom-modeline icons in daemon mode
                (with-selected-frame frame
                  (neon/frame-n-fonts)))) ; set transparency and font settings in daemon mode
  (neon/frame-n-fonts)
  )

;;keybindings and line-numbers
(global-display-line-numbers-mode t)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; general ui & general configuration.
(scroll-bar-mode -1) ; disable scroll bars.
(menu-bar-mode -1) ; disable menu bars.
(tooltip-mode 0) ; disable tooltips.
(tool-bar-mode 0) ; disable toolbars.
(fringe-mode 0) ; don't show fringes.
(column-number-mode t) ; show column numbers.
(save-place-mode t) ; remember the place of last cursor position in buffers.
(global-auto-revert-mode) ; to automatically show changes in buffers.
(auto-save-mode t) ; automatically save files.
(setq tab-width 4) ; set tab-width to 4.
(setq use-dialog-box nil) ; don't show dialog boxes.
(setq visible-mode t)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))) ; set the initial buffer to dashboard
(setq native-comp-async-report-warnings-errors nil) ; disable compiler warnings as they are disruptive.

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
