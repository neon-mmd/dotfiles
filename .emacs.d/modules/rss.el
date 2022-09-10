;; elfeed to read rss feeds
(use-package elfeed
  :commands elfeed
  :straight t
  :init (elfeed-update)
  )

;; elfeed-org to enhance elfeed
(use-package elfeed-org
  :hook(elfeed . elfeed-org)
  :straight t
  :custom((rmh-elfeed-org-files (list "~/rest/rss-feeds/elfeed.org")))
  )

;; elfeed-goodies to further enhance elfeed
(use-package elfeed-goodies
  :after dashboard
  :straight t
  :init (elfeed-goodies/setup)
  )

(provide 'rss)
