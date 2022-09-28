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
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-completion-show-kind t)
  (setq lsp-completion-provider :none)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet t)
  (setq tab-always-indent 'complete)
  (setq read-process-output-max (* 3 (* 1024 1024))) ;; 3MB
  ;; (setq gc-cons-threshold 100000000)
  (setq lsp-idle-delay 0.500)
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
  )

;;treemacs
(use-package lsp-treemacs
  :straight t
  :config
  (setq treemacs-width 30)
  (setq treemacs--width-is-locked nil)
  (setq treemacs-width-is-initially-locked nil)
  :hook(lsp-mode . lsp-treemacs-sync-mode)
  )

;;lsp ivy integration
(use-package consult-lsp
  :straight t
  :after lsp
  )

;; beautify corfu with icons
(use-package kind-icon
  :straight t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  (kind-icon-use-icons t)
  (kind-icon-blend-background nil)
  (kind-icon-blend-frac 0.08)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  )

;; add corfu doc to completions 
(use-package corfu-doc
  :straight t
  :after corfu
  :hook(corfu-mode . corfu-doc-mode)
  :custom
  (corfu-doc-delay 0.5)
  (corfu-doc-max-width 70)
  (corfu-doc-max-height 20)
  )

;; show completions
(use-package corfu
  :straight t
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto nil)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect-first t)    ;; enable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  (corfu-scroll-margin 4)        ;; Use scroll margin
  (corfu-auto-prefix 1)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-count 14)
  (corfu-echo-documentation nil)
  (corfu-auto-delay 0.25)


  ;; Enable Corfu only for certain modes.
  :hook (prog-mode . corfu-mode)
  )

;; A few more useful configurations...
(use-package emacs
  :straight nil
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold nil)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
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

;; lsp language servers
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :custom
  (lsp-pyright-typechecking-mode nil)
  (lsp-pyright-auto-search-paths t)
  (lsp-pyright-diagnostic-mode "workspace")
  (lsp-pyright-use-library-codes-for-types t)
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3"))
  )

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
          ("FIXME"      bold :background "#ff0000" :foreground "#ffffff")
          ("BUG"        bold :background "#ff0000" :foreground "#ffffff")
          ("FIXIT"      bold :background "#ff0000" :foreground "#ffffff")
          ("ISSUE"      bold :background "#ff0000" :foreground "#ffffff")
          ("HACK"       bold :background "#E6BF00" :foreground "#000000")
          ("PERF"       bold :background "#80D4FF" :foreground "#000000")
          ("NOTE"       bold :background "#B3B300" :foreground "#000000")
          ("TEST"       bold :background "#0000ff" :foreground "#000000")
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
