
;; Prerequisites:
;;   - stack setup
;;   - stack build intero
;;   - stack install apply-refact codex hasktags hlint hpack
;;   - codex set format emacs
;;

(use-package haskell-mode
  :ensure t
  :defer t

  :bind (:map haskell-mode-map
              ("M-g i" . haskell-navigate-imports)
              ("M-g M-i" . haskell-navigate-imports))

  :init
  (setq haskell-compile-cabal-build-alt-command "cd %s && stack clean && stack build --ghc-options -ferror-spans"
        haskell-compile-cabal-build-command     "cd %s && stack build --ghc-options -ferror-spans"
        haskell-compile-command                 "stack ghc -- -Wall -ferror-spans -fforce-recomp -c %s")

  :config
  (unbind-key "C-c C-b" haskell-mode-map) ;; haskell-mode-enable-process-minor-mode
  (unbind-key "C-c TAB" haskell-mode-map) ;; haskell-mode-enable-process-minor-mode
  (unbind-key "C-c C-l" haskell-mode-map) ;; haskell-mode-enable-process-minor-mode
  (unbind-key "C-c C-s" haskell-mode-map) ;; haskell-mode-toggle-scc-at-point
  (unbind-key "C-c C-t" haskell-mode-map) ;; haskell-mode-enable-process-minor-mode
  (unbind-key "C-c C-v" haskell-mode-map) ;; haskell-mode-enable-process-minor-mode
  (unbind-key "C-c C-," haskell-mode-map) ;; haskell-mode-format-imports
  )

(use-package haskell-snippets
  :ensure t
  :defer t)

(use-package hlint-refactor
  :ensure t
  :defer t
  :diminish ""

  :init
  (add-hook 'haskell-mode-hook #'hlint-refactor-mode)

  :config
  (unbind-key "C-c , b" hlint-refactor-mode-map)
  (unbind-key "C-c , r" hlint-refactor-mode-map)
  (define-key hlint-refactor-mode-map (kbd "C-c ,") nil)
  (define-key hlint-refactor-mode-map (kbd "C-c i r b") 'hlint-refactor-refactor-buffer)
  (define-key hlint-refactor-mode-map (kbd "C-c i r p") 'hlint-refactor-refactor-at-point))

(use-package intero
  :ensure t
  :defer t
  :diminish " λ"

  :bind (:map intero-mode-map
              ("M-." . init-intero-goto-definition)
              ("C-c i t" . intero-type-at)
              ("C-c i i" . intero-info)
              ("C-c i c" . intero-repl-eval-region)
              ("C-c i a" . intero-apply-suggestions)
              ("C-c i z" . intero-repl)
              ("C-c i l" . intero-repl-load)
              ("C-c i e" . intero-expand-splice-at-point)
              )

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
  (unbind-key "C-c C-c" intero-mode-map)
  (unbind-key "C-c C-e" intero-mode-map)
  (unbind-key "C-c TAB" intero-mode-map)
  (unbind-key "C-c C-l" intero-mode-map)
  (unbind-key "C-c C-r" intero-mode-map)
  (unbind-key "C-c C-t" intero-mode-map)
  (unbind-key "C-c C-z" intero-mode-map)

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
