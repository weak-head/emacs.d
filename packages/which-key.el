(use-package which-key
  :ensure t
  :demand
  :diminish ""

  :init
  (which-key-mode)
  (which-key-setup-side-window-right)

  :config
  (setq which-key-idle-delay 0.4
        which-key-compute-remaps t
        which-key-sort-order 'which-key-key-order-alpha)

  (which-key-add-key-based-replacements
    ;; default prefixes
    "C-x 8" "unicode"
    "C-x a" "abbrev/expand"
    "C-x r" "register/bookmark"

    ;; magit
    "C-c g"   "magit"
    "C-c g s" "status"
    "C-c g l" "log"
    "C-c g k" "discard"
    "C-c g t" "stage"
    "C-c g u" "unstage"
    "C-c g c" "commit"
    "C-c g b" "branch"
    "C-c g p" "push"
    "C-c g P" "pull"

    ;; helm
    "C-c h"   "helm"
    "C-c h f" "multi files"
    "C-c h i" "imenu"
    "C-c h I" "imenu all"
    "C-c h s" "swoop all"
    "C-c h S" "swoop selected"

    ;; projectile
    "C-c p" "projectile"

    ;; paren
    "C-c e"   "paren"
    "C-c e s" "splice"
    "C-c e t" "split"
    "C-c e j" "join"

    ;; files
    "C-c f"   "files"
    "C-c f j" "dired jump"

    ;; window
    "C-c w"   "window"
    "C-c w u" "undo"
    "C-c w r" "redo"

    ;; toggle
    "C-c t"   "toggle"
    "C-c t l" "linum"
    "C-c t w" "whitespace"

    ;; highlight
    "M-s h" "highlight"

    ;; flycheck
    "C-c !" "flycheck"

    ;; yasnippet
    "C-c &" "yasnippet"
    )
  )
