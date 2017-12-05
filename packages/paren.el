(use-package paren
  :ensure t
  :defer t
  :init
  (show-paren-mode))

(use-package paredit
  :ensure t
  :defer t
  
  :bind (:map paredit-mode-map
              ("{" . paredit-open-curly)
              ("}" . paredit-close-curly))
  
  :init
  (progn
    (setq paredit-lighter " ()"))
  
  :config
  (progn
    (unbind-key ";" paredit-mode-map)
    (unbind-key "M-;" paredit-mode-map)
    (unbind-key "M-?" paredit-mode-map)
    (unbind-key "\\" paredit-mode-map)))

(use-package smartparens
  :ensure t
  :defer t
  :diminish " $"
  
  :bind (:map smartparens-mode-map
              ("M-N" . sp-next-sexp)
              ("M-P" . sp-previous-sexp)
              ("C-c e s" . sp-splice-sexp)
              ("C-c e t" . sp-split-sexp)
              ("C-c e j" . sp-join-sexp))
  
  :bind (:map smartparens-strict-mode-map
              (")" . sp-up-sexp))
  
  :init
  (progn
    (setq sp-base-key-bindings 'paredit)
    (add-hook 'prog-mode-hook #'turn-on-smartparens-strict-mode))
  
  :config
  (progn
    (unbind-key "M-s" smartparens-mode-map)
    (require 'smartparens-config)))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (dolist (hook '(text-mode-hook prog-mode-hook))
    (add-hook hook #'rainbow-delimiters-mode)))
