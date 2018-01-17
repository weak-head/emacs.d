;; Prerequesites:
;;  - all-the-icons

(use-package spaceline
  :ensure t

  :init
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
        powerline-default-separator 'arrow)

  :config
  (spaceline-helm-mode)
  (spaceline-emacs-theme))

(use-package spaceline-all-the-icons
  :ensure t

  :after spaceline

  :config
  (setq spaceline-all-the-icons-separator-type 'cup
        spaceline-all-the-icons-icon-set-modified 'toggle
        spaceline-all-the-icons-icon-set-flycheck-slim 'outline
        spaceline-all-the-icons-flycheck-alternate t
        spaceline-all-the-icons-highlight-file-name t
        spaceline-all-the-icons-hide-long-buffer-path t
        )

  (spaceline-all-the-icons--setup-neotree)

  (spaceline-all-the-icons-theme))
