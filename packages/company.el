(use-package company
  :ensure t
  :diminish ""
  :defer t

  :init
  (setq company-idle-delay 0.3)
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :defer t

  :config
  (add-hook 'company-mode-hook #'company-quickhelp-mode))
