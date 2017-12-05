(use-package csharp-mode
  :ensure t
  :defer t)

(use-package omnisharp
  :ensure t
  :defer t

  :bind (:map omnisharp-mode-map
              ("M-." . omnisharp-go-to-definition))

  :init
  (when (eq system-type 'windows-nt)
      ;; For windows we are having this hardcoded path
      (setq omnisharp-server-executable-path
            "C:\\Program Files\\omnisharp\\OmniSharp.exe"))
  
  (push 'company-omnisharp company-backends)
  (add-hook 'csharp-mode-hook #'omnisharp-mode))
