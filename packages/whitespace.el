(use-package whitespace
  :ensure nil

  :bind (("C-c t w" . whitespace-mode))

  :config
  (setq whitespace-style '(face indentation space-after-tab
                                space-before-tab tab-mark
                                empty trailing lines-tail))
  (setq whitespace-line-column nil))

(use-package ws-butler
  :ensure t
  :diminish ""
  :config
  (ws-butler-global-mode t))
