;;; paren.el --- Paren related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Paren realated configuration.
;;

;;; Code:
;;
;;

(use-package paren
  :ensure t
  :defer t
  :init
  (show-paren-mode))

;;
;; M-s   splice-sexp
;;
;; M-S   split-sexp
;; M-J   join-sexps
;;
;; M-;   comment-dwim
;;
;; M-r   raise-sexp
;;
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
              ("M-P" . sp-previous-sexp))
  
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

;;; paren.el ends here
