(use-package which-key
  :ensure t
  :demand
  :diminish ""

  :init
  (which-key-mode)

  :config
  (setq which-key-idle-delay 0.4)
  (setq which-key-compute-remaps t)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)

   ; global map prefixes
  (which-key-add-key-based-replacements
    "C-x 8" "unicode"
    "C-x a" "abbrev/expand"
    "C-x r" "register/bookmark"

    "C-c !" "flycheck"
    "C-c &" "yasnippet"
    "C-c f" "files"
    "C-c p" "projectile"
    "C-c t" "toggle"
    "C-c e" "smartparens"
    "C-c w" "window"
    "C-c h" "helm"
    "C-c g" "magit"
    "M-s h" "highlight"

    ;; git
    "C-c g s" "status"
    "C-c g l" "log"
    "C-c g k" "discard"
    "C-c g t" "stage"
    "C-c g u" "unstage"
    "C-c g c" "commit"
    "C-c g b" "branch"
    "C-c g p" "push"
    "C-c g P" "pull"

    ))
