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
    "C-c p 4 D"   "[dired] open proj root"
    "C-c p 4 a"   "switch to file, other ext"
    "C-c p 4 b"   "switch to buffer"
    "C-c p 4 d"   "[dired] switch to folder"
    "C-c p 4 f"   "jump to a file"
    "C-c p 4 g"   "jump to file at point"
    "C-c p 4 t"   "jump impl/tests"
    "C-c p 5"     "other frame"
    "C-c p 5 D"   "[dired] open proj root"
    "C-c p 5 a"   "switch to file, other ext"
    "C-c p 5 b"   "switch to buffer"
    "C-c p 5 d"   "[dired] switch to folder"
    "C-c p 5 f"   "jump to a file"
    "C-c p 5 g"   "jump to file at point"
    "C-c p 5 t"   "jump impl/tests"
    "C-c p s"     "search"
    "C-c p s g"   "grep"
    "C-c p s s"   "ag"
    "C-c p x"     "run"
    "C-c p x e"   "eshell"
    "C-c p x s"   "shell"
    "C-c p x t"   "terminal"
    "C-c p ESC"   "switch to recent buffer"
    "C-c p !"     "run shell command"
    "C-c p &"     "run shell command (async)"
    "C-c p C"     "run configure command"
    "C-c p D"     "[dired] open proj root"
    "C-c p E"     "edit dir-locals.el"
    "C-c p F"     "jump to a file (all projs)"
    "C-c p I"     "ibuffer"
    "C-c p P"     "run test command"
    "C-c p R"     "regenerate tags"
    "C-c p S"     "save project buffers"
    "C-c p T"     "jump to a test file"
    "C-c p V"     "browse dirty projects"
    "C-c p a"     "switch to file, other ext"
    "C-c p b"     "switch to buffer"
    "C-c p c"     "run compile command"
    "C-c p d"     "[dired] switch to folder"
    "C-c p e"     "jump to recent file"
    "C-c p f"     "jump to a file"
    "C-c p g"     "jump to a file at point"
    "C-c p h"     "helm projectile"
    "C-c p i"     "invalidate project cache"
    "C-c p j"     "find tag"
    "C-c p k"     "kill all buffers"
    "C-c p l"     "jump to a file in a dir"
    "C-c p m"     "run commander"
    "C-c p o"     "occur in all proj buffers"
    "C-c p p"     "switch to known project"
    "C-c p q"     "switch to opened project"
    "C-c p r"     "replace"
    "C-c p t"     "toggle impl & test"
    "C-c p u"     "run project"
    "C-c p v"     "run vc-dir on root"
    "C-c p z"     "add the file to cache"

    ;; haskell/hlint/intero
    "C-c i"       "haskell"
    "C-c i b"     "[hlint] refactor buffer"
    "C-c i r"     "[hlint] refactor at point"

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
    "C-c !"     "flycheck"
    "C-c ! C-c" "compile using checker"
    "C-c ! C-w" "copy error at point"
    "C-c ! ?"   "describe a flycheck checker"
    "C-c ! C"   "clear errors in buffer"
    "C-c ! H"   "show local help"
    "C-c ! V"   "show flycheck version"
    "C-c ! c"   "check current buffer"
    "C-c ! e"   "explain error at point"
    "C-c ! h"   "display error at point"
    "C-c ! i"   "open flycheck manual"
    "C-c ! l"   "list all errors"
    "C-c ! n"   "jump to next error"
    "C-c ! p"   "jump to previous error"
    "C-c ! s"   "select syntax checker"
    "C-c ! v"   "verify setup"
    "C-c ! x"   "disable checker"

    ;; yasnippet
    "C-c &" "yasnippet"
    "C-c & C-n" "new snippet"
    "C-c & C-s" "insert snippet"
    "C-c & C-v" "visit snippet file"
    )
  )
