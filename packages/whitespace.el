(use-package whitespace
  :ensure nil
  :defer t
  :diminish " ws"

  :bind (("C-c t w" . whitespace-mode))

  :config
  (setq whitespace-style '(face indentation space-after-tab
                                space-before-tab tab-mark
                                empty trailing lines-tail))
  (setq whitespace-line-column nil))

(use-package ws-butler
  :ensure t
  :defer t
  :diminish ""

  :config
  (ws-butler-global-mode t))

(use-package highlight-indentation
  :ensure nil
  :defer t
  :diminish " ɧ"

  :bind (("C-c t i" . highlight-indentation-mode))
  )
