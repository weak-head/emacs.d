(use-package ace-window
  :ensure t
  :defer t

  :bind ("M-o" . ace-window)

  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

(use-package winner
  :defer t

  :bind (:map global-map
              ("C-c w u" . winner-undo)
              ("C-c w r" . winner-redo))

  :config
  (unbind-key "C-c <left>" winner-mode-map)
  (unbind-key "C-c <right>" winner-mode-map)
  (winner-mode t))

(use-package avy
  :ensure t

  :bind (("C-;"   . avy-goto-char-2)
         ("M-g l" . avy-goto-line))

  )
