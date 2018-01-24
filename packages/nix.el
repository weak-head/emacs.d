
(use-package nix-mode
  :ensure t
  :defer t)

(use-package nixos-options
  :ensure t
  :defer t)

(use-package helm-nixos-options
  :ensure t
  :defer t)

(use-package company-nixos-options
  :ensure t
  :defer t

  :config
  (add-to-list 'company-backends 'company-nixos-options))

(use-package nix-sandbox
  :ensure t
  :defer t)
