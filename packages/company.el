(use-package company
  :ensure t
  :demand
  :diminish ""
  
  :init
  (setq company-idle-delay 0.3)
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :demand
  
  :init
  (add-hook 'company-mode-hook #'company-quickhelp-mode))
