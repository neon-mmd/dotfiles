;;; -*- lexical-binding: t; -*-

(use-package posframe
  :straight t
  :after dashboard
  )

(use-package markdown-mode
  :straight t
  :after dashboard
  )

;; lsp-bridge: faster lsp server
(use-package lsp-bridge
  :straight (lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
			:files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources"))
  :hook(prog-mode . lsp-bridge-mode)
  )

;; emacs-neotree
(use-package emacs-neotree
  :straight t
  :after lsp-bridge-mode
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )

;; on the flychecking for errors
(use-package flycheck
  :straight t
  :after lsp-bridge-mode
  :hook(lsp-bridge-mode . flycheck-mode)
  )

;; yasnippet-snippets
(use-package yasnippet-snippets
  :after lsp-bridge-mode
  :straight t
  )

;; yasnippet code completion
(use-package yasnippet
  :hook(prog-mode . yas-minor-mode)
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
  :config
  (setq tab-width 2)
  :hook(java-mode-hook . lsp-bridge-mode)
  )

;; extra language modes in emacs
(use-package rust-mode
  :straight t
  :after dashboard
  )

(use-package lua-mode
  :straight t
  :after dashboard
  )

(use-package lsp-java
  :straight t
  :hook(java-mode-hook . lsp-bridge-mode)
  )

;; indicate incomplete brackets and braces
(use-package rainbow-delimiters
  :hook((lsp-bridge-mode
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
  :hook((lsp-bridge-mode
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
  :after lsp-bridge-mode
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
  :hook ((emacs-lisp-mode lsp-bridge-mode) . hl-todo-mode)
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

(use-package highlight-indent-guides
  :straight t
  :hook(prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  (highlight-indent-guides-responsive 'top)
  )

(use-package ts-fold-indicators
  :straight (ts-fold-indicators :type git :host github :repo "emacs-tree-sitter/ts-fold")
  :hook(tree-sitter-after-on-hook . ts-fold-indicators-mode)
  )

(use-package ts-fold
  :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold")
  :custom
  (ts-fold-summary-format " [+] %s ")
  (ts-fold-summary-exceeded-string "...........................................................")
  )

(provide 'programming)
