;;; go.el --- Configuration for Go mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Go related configuration.
;;

;;; Code:
;;
;;

;;
;;
(use-package go-mode
  :ensure t

  :init
  (push 'company-go company-backends))

;;
;;
(use-package company-go
  :ensure t
  :defer t

  :config
  (setq company-go-show-annotation t))

;;
;;
(use-package go-eldoc
  :ensure t)

;;; go.el ends here
