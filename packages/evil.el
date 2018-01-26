(use-package evil
  :ensure t

  :bind (("C-c t e" . evil-mode))
  )

;; (use-package evil-magit
;;   :defer t
;;   :init (require 'evil-magit))

;; (use-package evil-smartparens
;;   :defer t
;;   :init
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;;   (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
;;   :config
;;   (sp-pair "'" nil :actions :rem)
;;   (sp-pair "`" nil :actions :rem)
;;   (sp-use-paredit-bindings))
