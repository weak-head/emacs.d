;;; company.el --- Configuration for company mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Configuration for company mode.
;;

;;; Code:
;;
;;

;;
;; M-n    select next
;; M-p    select previous
;; C-s    search candidates
;; C-M-s  filter candidates
(use-package company
  :ensure t
  :demand
  :diminish ""
  
  :init
  (setq company-idle-delay 0.3)
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :demand
  
  :init
  (add-hook 'company-mode-hook #'company-quickhelp-mode))

;;; company.el ends here
