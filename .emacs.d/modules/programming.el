;; lsp
(use-package lsp-mode
  :hook ((c-mode          ; clangd
          c++-mode        ; clangd
          c-or-c++-mode   ; clangd
          java-mode       ; eclipse-jdtls
          js-mode         ; ts-ls (tsserver wrapper)
	  js2-mode        ; js    (tsserver wrapper)
          js-jsx-mode     ; ts-ls (tsserver wrapper)
          typescript-mode ; ts-ls (tsserver wrapper)
          python-mode     ; pyright
          css-mode        ; ts-ls/HTML/CSS
	  html-mode       ; hbs/html+
	  sh-mode         ; shell
	  lua-mode        ; lua-lang-server
	  rust-mode       ; rls
          ) . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  ;;(setq gc-cons-threshold 100000000)
  (setq lsp-idle-delay 0.5)
  )

;; lsp-ui
(use-package lsp-ui
  :straight t
  :hook(lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-mode 0)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-mode 1)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions nil)
  )

;;treemacs
(use-package lsp-treemacs
  :straight t
  :hook(lsp-mode . lsp-treemacs-sync-mode)
  )

;;lsp ivy integration
(use-package consult-lsp
  :straight t
  :after lsp
  )

;; adding yasnippet as a company backend
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

;; company mode completion
(use-package company-lsp
  :straight t
  :after lsp
  :hook (lsp-mode . company-mode)
  :custom(
	  (company-minimum-prefix-length 1)
	  (company--idle-delay 0.0)
	  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
  )

;; make company-ui better
(use-package company-box
  :straight t
  :hook(company-mode . company-box-mode)
  )

;; make company remember recent and frequently used completion
(use-package company-prescient
  :straight t
  :after company
  :init
  (company-prescient-mode +1)
  )

;; on the flychecking for errors
(use-package flycheck
  :straight t
  :after lsp-mode
  :hook(lsp-mode . flycheck-mode)
  )

;; yasnippet-snippets
(use-package yasnippet-snippets
  :after lsp
  :straight t
  )

;; yasnippet code completion
(use-package yasnippet
  :hook(lsp-mode . yas-minor-mode)
  :straight t
  :config
  (yas-reload-all)
  )

;; comment out lines using M-/
(use-package evil-nerd-commenter
  :after evil
  )

;; emacs-lisp-mode and company
(use-package emacs-lisp-mode
  :straight nil
  :hook(emacs-lisp-mode . company-mode)
  )

;; lsp language servers
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(use-package lsp-java
  :straight t
  :hook(java-mode-hook . lsp))

;; extra language modes in emacs
(use-package rust-mode
  :straight t
  :after dashboard
  )

(use-package lua-mode
  :straight t
  :after dashboard
  )

;; indicate incomplete brackets and braces
(use-package rainbow-delimiters
  :hook((lsp-mode
	 emacs-lisp-mode)
	. rainbow-delimiters-mode)
  :after dashboard
  :straight t
  )

;; auto-complete parentheses and braces
(use-package smartparens
  :hook(prog-mode . smartparens-mode)
  :straight t
  )

;; visulise color with rainbow-mode
(use-package rainbow-mode
  :hook((lsp-mode
	 emacs-lisp-mode)
	. rainbow-mode)
  :straight t
  :after dashboard
  )

;; format code automatically
(use-package format-all
  :straight t
  :custom
  (setq format-all-default-formatters
	'(("Assembly" asmfmt)
	  ("C" clang-format)
	  ("C++" clang-format)
	  ("CMake" cmake-format)
	  ("Emacs Lisp" emacs-lisp)
	  ("Fish" beautysh)   ; fish-indent
	  ("HTML" html-tidy)
	  ("Java" clang-format)
	  ("JavaScript" prettier)
	  ("JSON" prettier)
	  ("JSON5" prettier)
	  ("JSX" prettier)
	  ("Lua" lua-fmt)
	  ("Markdown" prettier)
	  ("Python" black)
	  ("Rust" rustfmt)
	  ("Shell" beautysh)
	  ("SQL" sqlformat)
	  ("TOML" prettier)
	  ("XML" html-tidy)
	  ("YAML" prettier)
	  )
	)

  :hook (format-all-mode-hook . format-all-ensure-formatter)
  :after lsp
  )

;; ligature support for emacs
(use-package ligature
  :straight t
  :after dashboard
  :config
  ;; Enable all Iosevka ligatures in programming modes
  (ligature-set-ligatures 't '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                               "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                               "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                               ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t)
  )

;; hl-todo to highlight todos
(use-package hl-todo
  :straight t
  :hook ((emacs-lisp-mode lsp-mode) . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       bold :background "#66B3FF" :foreground "#000000")
          ("FIX"        bold :background "#ff0000" :foreground "#ffffff")
          ("HACK"       bold :background "#E6BF00" :foreground "#000000")
          ("PERF"       bold :background "#80D4FF" :foreground "#000000")
          ("NOTE"       bold :background "#B3B300" :foreground "#000000")
          ("WARNING"    bold :background "#808000" :foreground "#000000")))
  )

;; install treesitter
(use-package tree-sitter
  :straight t
  :after dashboard
  :init
  ;; enable treesitter highlighting
  (global-tree-sitter-mode)
  )

;; install treesitter language parser
(use-package tree-sitter-langs
  :straight t
  :after dashboard
  )

(provide 'programming)
