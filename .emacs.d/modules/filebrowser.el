;; improving dired
(use-package dired
  :after dashboard
  :straight nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-agh --group-directories-first"))
  )

;; open only single dired buffer
(use-package dired-single
  :straight t
  :commands (dired dired-jump find-file)
  )

(provide 'filebrowser)
