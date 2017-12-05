(use-package spaceline
  :ensure t

  :init
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
        powerline-default-separator 'arrow)

  :config
  (spaceline-helm-mode)
  (spaceline-emacs-theme))
