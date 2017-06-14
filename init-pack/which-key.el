;;; which-key.el --- Which-key configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; which-key configuration.
;;

;;; Code:
;;
;;

(use-package which-key
  :ensure t
  :demand
  :pin melpa

  :init
  (which-key-mode)

  :config
  (setq which-key-idle-delay 0.4)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)

   ; global map prefixes
  (which-key-add-key-based-replacements
    "C-c !" "flycheck"
    "C-c &" "yasnippet"
    "C-c f" "files"
    "C-c p" "projectile"
    "C-c t" "toggle"))

;;; which-key.el ends here
