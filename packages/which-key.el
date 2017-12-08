(use-package which-key
  :ensure t
  :demand
  :diminish ""

  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)

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
    "C-c p"       "projectile"
    "C-c p 4"     "other window"
    "C-c p 4 C-o" "display buffer"
    "C-c p 4 D"   "dired"
    "C-c p 4 a"   "other file"
    "C-c p 4 b"   "buffer"
    "C-c p 4 d"   "dir"
    "C-c p 4 f"   "file"
    "C-c p 4 g"   "dwim"
    "C-c p 4 t"   "tests"
    "C-c p 5"     "other frame"
    "C-c p 5 D"   "dired"
    "C-c p 5 a"   "other file"
    "C-c p 5 b"   "buffer"
    "C-c p 5 d"   "dir"
    "C-c p 5 f"   "file"
    "C-c p 5 g"   "dwim"
    "C-c p 5 t"   "tests"
    "C-c p s"     "search"
    "C-c p s g"   "grep"
    "C-c p s s"   "ag"
    "C-c p x"     "run"
    "C-c p x e"   "eshell"
    "C-c p x s"   "shell"
    "C-c p x t"   "terminal"
    ;;"C-c p ESC"   "other buffer"
    "C-c p !"     "shell command"
    "C-c p &"     "shell command (async)"
    ;;"C-c p C"     "configure"
    "C-c p D"     "dired"
    "C-c p E"     "edit dir-locals.el"
    "C-c p F"     "find file in all projects"
    "C-c p I"     "ibuffer"
    "C-c p P"     "test project"
    "C-c p R"     "regenerate tags"
    "C-c p S"     "save project buffers"
    "C-c p T"     "find test file"
    "C-c p V"     "browse dirty projects"
    "C-c p a"     "find other file"
    "C-c p b"     "switch to buffer"
    "C-c p c"     "compile"
    "C-c p d"     "find dir"
    "C-c p e"     "recent file"
    "C-c p f"     "find file"
    "C-c p g"     "find file (dwim)"
    "C-c p h"     "helm projectile"
    "C-c p i"     "invalidate cache"
    "C-c p j"     "find tag"
    "C-c p k"     "kill buffers"
    "C-c p l"     "find file in directory"
    "C-c p m"     "commander"
    "C-c p o"     "multi occur"

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
    "M-s h"   "highlight"
    "M-s h w" "save pattern"
    "M-s h f" "load pattern"
    "M-s h l" "line"
    "M-s h p" "phrase"
    "M-s h r" "regexp"
    "M-s h ." "symbol"
    "M-s h u" "unhighlight"

    ;; flycheck
    "C-c !" "flycheck"

    ;; yasnippet
    "C-c &" "yasnippet"
    )
  )
