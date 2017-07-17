;;; haskell.el --- Configuration for Haskell mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Haskell related configuration.
;;
;; Requirements:
;;
;;   stack setup
;;   stack build intero
;;   stack install apply-refact codex hasktags hlint hpack
;;   codex set format emacs
;;

;;; Code:
;;
;;

;;
;; M-g i    navigate to imports
;; C-c C-,  format imports
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

;;
;; mod     modele declaration
;; main    main module and main function
;; lang    LANGUAGE pragma
;; opt     OPTIONS_GHC pragma
;;
;; M-/   hippie-expand the snippet
(use-package haskell-snippets
  :ensure t
  :defer t)

;;
;; C-c , b   hlint refactor buffer
;; C-c , r   hlint refactor at point
(use-package hlint-refactor
  :ensure t
  :defer t
  :diminish ""

  :init
  (add-hook 'haskell-mode-hook #'hlint-refactor-mode))

;;
;; C-c C-i   intero info
;; C-c C-l   load the current module in REPL
;; C-c C-r   apply suggestion
;; C-c C-t   type at (C-u C-c C-t   insert type signature)
;; C-c C-z   switch back and forth between REPL and module
;; M-.       goto definition
;;
;; M-x intero-targets     -> add targets for intero  ->  C-c C-c  to apply
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

;;; haskell.el ends here
