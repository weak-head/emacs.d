(use-package nlinum
  :ensure t
  :defer t
  :diminish "ln"

  :bind (("C-c t l" . nlinum-mode))

  :config
  (setq nlinum-highlight-current-line t)
  )
