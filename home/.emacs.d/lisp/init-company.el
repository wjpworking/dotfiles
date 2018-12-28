(use-package company
  :diminish company-mode
  :defer t
  :ensure t
  :hook (after-init . global-company-mode))

(provide 'init-company)
