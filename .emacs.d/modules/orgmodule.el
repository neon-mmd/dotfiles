;; org
(use-package org
  :after dashboard
  :straight t  ; required to update the package
  :hook
  (org-mode . visual-line-mode)
  (org-mode . org-indent-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . neon/org-config)
  :custom
  (org-ellipsis " ▾")
  (org-startup-with-inline-images t)
  (org-hide-emphasis-markers t)
  (org-agenda-files '("~/rest/sheduledTasks/tasks.org"))
  )

;; making heading look fancier and elegant using org-bullets.
(use-package org-bullets
  :straight t
  :hook(org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("❂" "☢" "⊗" "✪" "⦾" "⦿" "•" "∙"))
  )

;; making org content centered to give document style look.
(use-package visual-fill-column
  :straight t
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-width 100)
  (visual-fill-column-center-text t)
  :init
  (visual-fill-column-mode 1)
  )

;; adding completion templates in org for productivity
;; and efficiency.
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (java . t)
     (shell . t)
     (css . t)
     (js . t)
     (lua . t)
     ))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))        ; bash template
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))   ; elisp template
  (add-to-list 'org-structure-template-alist '("py" . "src python"))       ; python template
  (add-to-list 'org-structure-template-alist '("txt" . "src text"))        ; text template
  (add-to-list 'org-structure-template-alist '("java" . "src java"))       ; java template
  (add-to-list 'org-structure-template-alist '("html" . "src html"))       ; html template
  (add-to-list 'org-structure-template-alist '("js" . "src javascript"))   ; javascript template
  (add-to-list 'org-structure-template-alist '("rs" . "src rust"))         ; rust template
  (add-to-list 'org-structure-template-alist '("c++" . "src c++"))         ; c++ template
  (add-to-list 'org-structure-template-alist '("lua" . "src lua"))         ; lua template
  (add-to-list 'org-structure-template-alist '("css" . "src css"))         ; css template
  )

;; org roam to manage project notes
(use-package org-roam
  :straight t
  :demand t ; to ensure it is loaded by default
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/rest/OrgRoamNotes")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(
     ("d" "default" plain
      "%?"
      :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n#+Author: destruct\n#+category: ${title}\n#+date: %U\n")
      :unnarrowed t)

     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Task List\n\n* Dates\n\n"
      :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org" "#+title: ${title}\n#+filetags: Project\n#+category: ${title}\n#+Author: destruct\n#+date: %U\n")
      :unnarrowed t)
     )
   )
  :config
  (org-roam-setup)
  )

(provide 'orgmodule)
