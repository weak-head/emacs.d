;;; helm.el --- Configuration for helm. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Helm configuration.

;;; Code:

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

;;; helm.el ends here
