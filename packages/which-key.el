(use-package which-key
  :ensure t
  :demand
  :diminish ""
  :pin melpa

  :init
  (which-key-mode)

  :config
  (setq which-key-idle-delay 0.4)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)

   ; global map prefixes
  (which-key-add-key-based-replacements
    "C-c !" "flycheck"
    "C-c &" "yasnippet"
    "C-c f" "files"
    "C-c p" "projectile"
    "C-c t" "toggle"
    "C-c e" "smartparens"
    "C-c w" "window"
    "C-c h" "helm"
    "C-c g" "magit"
    "M-s h" "highlight"))
