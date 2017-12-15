(use-package demo-it
  :ensure t
  :defer t)

(use-package expand-region
  :ensure t
  :defer t
  :bind ("C-=" . er/expand-region))

(use-package fancy-narrow
  :ensure t

  :bind (("C-c 0 r" . fancy-narrow-to-region)
         ("C-c 0 d" . fancy-narrow-to-defun)
         ("C-c 0 p" . fancy-narrow-to-page)
         ("C-c 0 w" . fancy-widen))

  :defer t)
