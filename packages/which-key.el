(use-package which-key
  :ensure t
  :demand
  :defer t
  :diminish ""

  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)

  :config
  (setq which-key-idle-delay 0.7
        which-key-compute-remaps t
        which-key-sort-order 'which-key-key-order-alpha)

  (which-key-add-key-based-replacements
    ;; default prefixes
    "C-x 8" "unicode"
    "C-x a" "abbrev/expand"

    ;; magit
    "C-c g"   "magit"
    "C-c g s" "status"
    "C-c g l" "log"
    "C-c g d" "diff"
    "C-c g t" "stage"
    "C-c g u" "unstage"
    "C-c g a" "amend"
    "C-c g c" "commit"
    "C-c g b" "branch"
    "C-c g m" "merge"
    "C-c g r" "rebase"
    "C-c g f" "fetch"
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
    "C-c &"     "yasnippet"
    "C-c & C-n" "new snippet"
    "C-c & C-s" "insert snippet"
    "C-c & C-v" "visit snippet file"

    ;; fancy-narrow
    "C-c 0"     "fancy narrow"
    "C-c 0 r"   "region"
    "C-c 0 d"   "defun"
    "C-c 0 p"   "page"
    "C-c 0 w"   "widen"

    ;; align
    "C-c 3"     "beautify"
    "C-c 3 r"   "align regexp"
    "C-c 3 w"   "whitespace cleanup"

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
    "C-c t"     "toggle"
    "C-c t l"   "linum"
    "C-c t w"   "whitespace"
    "C-c t e"   "evil"
    "C-c t r"   "rainbow"
    "C-c t m"   "minimap"
    "C-c t t"   "time"
    "C-c t i"   "highlight indent"

    ;; browse
    "C-c 8"          "browse"
    "C-c 8 u"        "URL at point"
    "C-c 8 SPC"      "[google] region"
    "C-c 8 l"        "[google] line"
    "C-c 8 n"        "[google] this"
    "C-c 8 w"        "[google] word"
    "C-c 8 <return>" "[google] input"

    ;; highlight
    "M-s h"   "highlight"
    "M-s h w" "save pattern"
    "M-s h f" "load pattern"
    "M-s h l" "line"
    "M-s h p" "phrase"
    "M-s h r" "regexp"
    "M-s h ." "symbol"
    "M-s h u" "unhighlight"

    ;; goto
    "M-g TAB" "column"
    "M-g c"   "char"
    "M-g g"   "line"
    "M-g n"   "next error"
    "M-g p"   "previous error"
    "M-g M-g" "line"           ;; redundant
    "M-g M-n" "next error"     ;; redundant
    "M-g M-p" "previous error" ;; redundant
    "M-g l"   "[avy] line"
    "C-;"     "[avy] char"

    ;; build-in utility commands
    "C-x C-SPC"   "[global] pop mark"
    "C-u C-SPC"   "[local] pop mark"
    "C-x C-x"     "exchange mark and point"
    "C-x C-e"     "evaluate last s-exp"
    "C-x ="       "what cursor position" ;; C-u C-x =

    ;; windows, frames
    "C-x 0"       "delete window"
    "C-x 1"       "delete other windows"
    "C-x 2"       "split window below"
    "C-x 3"       "split window right"
    "C-x 4"       "other window"
    "C-x 4 C-f"   "find file"
    "C-x 4 C-o"   "display buffer"
    "C-x 4 ."     "find definition"
    "C-x 4 0"     "kill buffer"
    "C-x 4 a"     "add change log entry"
    "C-x 4 b"     "switch to buffer"
    "C-x 4 c"     "clone buffer"
    "C-x 4 d"     "dired"
    "C-x 4 f"     "find file"
    "C-x 4 m"     "compose mail"
    "C-x 4 r"     "find file (ro)"
    "C-x 5"       "other frame"
    "C-x 5 C-f"   "find file"
    "C-x 5 C-o"   "display buffer"
    "C-x 5 ."     "find definition"
    "C-x 5 0"     "kill frame"
    "C-x 5 1"     "kill other frame"
    "C-x 5 2"     "create frame"
    "C-x 5 b"     "switch to buffer"
    "C-x 5 d"     "dired"
    "C-x 5 f"     "find file"
    "C-x 5 m"     "compose mail"
    "C-x 5 o"     "navigate to frame"       ;; redundant
    "C-x 5 r"     "find file (ro)"

    ;; bookmarks-bm
    "<f5>"        "next bm-bookmark"
    "S-<f5>"      "previous bm-bookmark"
    "C-<f5>"      "toogle bm-bookmark"

    ;; registers, bookmarks, rectangles
    "C-x r"       "register/bookmark"
    "C-x r m"     "[bookmark] set"
    "C-x r M"     "[bookmark] set (safe)"
    "C-x r l"     "[bookmark] list"
    "C-x r b"     "[bookmark] jump"
    "C-x r n"     "[reg] store number"
    "C-x r s"     "[reg] store region"
    "C-x r SPC"   "[reg] store point"
    "C-x r +"     "[reg] increment number"
    "C-x r j"     "[reg] jump"
    "C-x r x"     "[reg] copy"
    "C-x r g"     "[reg] insert content"
    "C-x r i"     "[reg] insert content"
    "C-x r w"     "[reg] store window config"
    "C-x r f"     "[reg] store frameset"
    "C-x r C-SPC" "[reg] point to register"
    "C-x r C-@"   "[reg] point to register"
    "C-x r k"     "[rect] kill"
    "C-x r M-w"   "[rect] copy"
    "C-x r d"     "[rect] delete"
    "C-x r y"     "[rect] yank"
    "C-x r c"     "[rect] clear"
    "C-x r o"     "[rect] insert blank"
    "C-x r t"     "[rect] replace with text"
    "C-x r N"     "[rect] insert numbering"
    "C-x r r"     "[rect] copy to register"
    "C-x r u"     "[undo] state to register"
    "C-x r U"     "[undo] restore state"
    )

  (which-key-add-major-mode-key-based-replacements 'haskell-mode
    ;; haskell/hlint/intero
    "C-c i"       "haskell"
    "C-c i r"     "refactor"
    "C-c i r b"   "[hlint] refactor buffer"
    "C-c i r p"   "[hlint] refactor at point"
    "C-c i r a"   "[intero] apply suggestion"
    "C-c i r i"   "[hmode] format imports"
    "C-c i t"     "type at point"
    "C-c i i"     "info at point"
    "C-c i c"     "compile"
    "C-c i z"     "switch to REPL"
    "C-c i l"     "load module to REPL"
    "C-c i e"     "expand template"
    "C-c i R"     "[intero] restart"

    "C-c i h"     "help"
    "C-c i h y"   "hayoo"
    "C-c i h h"   "hoogle"

    "M-g i"       "navigate to imports"
    "M-g M-i"     "navigate to imports"
    )

  (which-key-add-major-mode-key-based-replacements 'intero-repl-mode
    ;;intero-repl
    "C-c i"       "repl"
    "C-c i z"     "switch from REPL"
    "C-c i k"     "clean REPL"
    )

  (which-key-add-major-mode-key-based-replacements 'python-mode
    ;; python/elpy
    "C-c i"       "elpy"
    "C-c i r"     "refactor"
    "C-c i r c"   "autopep8 fix code"
    )
  )
