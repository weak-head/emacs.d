;;; helm.el --- Configuration for helm. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Helm configuration.
;;

;;; Code:
;;
;;

;;
;; C-M-y     helm show kill ring
;; C-x C-f   helm find files
;; C-h a     helm apropos
;; C-x b     helm mini
;; M-s o     helm occur
;; M-x       helm M-x
;;
;; Use "C-j" instead of TAB
;;
(use-package helm
  :ensure t
  :demand
  :diminish ""

  :bind (("C-M-y" . helm-show-kill-ring)
         ("C-h a" . helm-apropos)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("M-s o" . helm-occur)
         ("M-x" . helm-M-x)
         :map helm-map
         ([tab] . helm-execute-persistent-action))

  :init
  (setq helm-M-x-fuzzy-match t
        helm-apropos-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-ff-newfile-prompt-p nil
        helm-locate-fuzzy-match t
        helm-recentf-fuzzy-match t)
  (require 'helm-config)
  (helm-mode))

;;
(use-package helm-swoop
  :ensure t
  :demand

  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all)
         :map isearch-mode-map
         ("M-i" . helm-swoop-from-isearch)
         :map helm-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line)
         :map helm-multi-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line))
  
;;  :init
;;  (setq helm-swoop-use-fuzzy-match t)
  )

;;; helm.el ends here
