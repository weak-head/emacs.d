(use-package haskell-mode
  :ensure t
  :defer t

  :bind (:map haskell-mode-map
              ("M-g i" . haskell-navigate-imports)
              ("M-g M-i" . haskell-navigate-imports))

  :init
  (setq haskell-compile-cabal-build-alt-command
        "cd %s && stack clean && stack build --ghc-options -ferror-spans"
        haskell-compile-cabal-build-command
        "cd %s && stack build --ghc-options -ferror-spans"
        haskell-compile-command
        "stack ghc -- -Wall -ferror-spans -fforce-recomp -c %s"))

(use-package haskell-snippets
  :ensure t
  :defer t)

(use-package hlint-refactor
  :ensure t
  :defer t
  :diminish ""

  :init
  (add-hook 'haskell-mode-hook #'hlint-refactor-mode))

(use-package intero
  :ensure t
  :defer t
  :diminish " λ"

  :bind (:map intero-mode-map
              ("M-." . init-intero-goto-definition))

  :init
  (defun init-intero ()
    "Enable Intero unless visiting a cached dependency."
    (if (and buffer-file-name
             (string-match ".+/\\.\\(stack\\|stack-work\\)/.+" buffer-file-name))
        (progn
          (eldoc-mode -1)
          (flycheck-mode -1))
      (intero-mode)
      (setq projectile-tags-command "codex update")))

  (add-hook 'haskell-mode-hook #'init-intero)

  :config
  (defun init-intero-goto-definition ()
    "Jump to the definition of the thing at point using Intero or etags."
    (interactive)
    (or (intero-goto-definition)
        (find-tag (find-tag-default))))

  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

(use-package company-cabal
  :ensure t
  :defer t
  
  :init
  (defun init-haskell-cabal ()
    (add-to-list (make-local-variable 'company-backends) #'company-cabal))

  (add-hook 'haskell-cabal-mode-hook #'init-haskell-cabal))

(use-package cmm-mode
  :ensure t
  :defer t)
