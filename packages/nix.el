
(use-package nix-mode
  :ensure t)

(use-package nixos-options
  :ensure t)

(use-package helm-nixos-options
  :ensure t)

(use-package company-nixos-options
  :ensure t

  :config
  (add-to-list 'company-backends 'company-nixos-options))

(use-package nix-sandbox
  :ensure t)
