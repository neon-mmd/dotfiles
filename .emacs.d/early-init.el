;;; early-init.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum); garbage collection threshold value

(setq native-comp-deferred-compilation nil)

(setq package-enable-at-startup nil)

(setq load-prefer-newer noninteractive)

;; defining font-size and frame-transparency variables
(defvar neon/def-font-size 120)
(defvar neon/variable-pitch-font-size 120)
(defvar neon/frame-transparency '(70 . 70))

(defun neon/frame-n-fonts ()
  ;; Set frame transparency
  (message "setting font-faces and frame")
  (set-frame-parameter (selected-frame) 'alpha neon/frame-transparency)
  (add-to-list 'default-frame-alist `(alpha . ,neon/frame-transparency))

  ;; setting font and sizes
  (set-face-attribute 'default nil :font "Source Code Pro" :height neon/def-font-size)
  (set-face-attribute 'variable-pitch nil :font "Iosevka Nerd Font" :height neon/variable-pitch-font-size :weight 'regular)
  (set-face-attribute 'fixed-pitch nil :font "Source Code Pro" :height neon/def-font-size)

  )

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

;; line-numbers
(global-display-line-numbers-mode t)

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

(unless (or (daemonp) noninteractive)
  (let ((old-file-name-handler-alist file-name-handler-alist))
    (setq-default file-name-handler-alist nil)
    (defun doom-reset-file-handler-alist-h ()
      (setq file-name-handler-alist
	    (delete-dups (append file-name-handler-alist
                                 old-file-name-handler-alist))))
    (add-hook 'emacs-startup-hook #'doom-reset-file-handler-alist-h 101))

  (setq-default inhibit-redisplay t
                inhibit-message t)
  (add-hook 'window-setup-hook
	    (lambda ()
	      (setq-default inhibit-redisplay nil
			    inhibit-message nil)
	      (redisplay)))

  (define-advice load-file (:override (file) silence)
    (load file nil 'nomessage))

  (define-advice startup--load-user-init-file (:before (&rest _) init-doom)
    (advice-remove #'load-file #'load-file@silence)))

(set-language-environment "UTF-8")

(setq default-input-method nil)

(setq user-emacs-directory (file-name-directory load-file-name))

(load (concat user-emacs-directory "init.el") nil 'nomessage)
