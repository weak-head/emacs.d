;;; window.el --- Configuration for all related window modes. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Configuration for all related window modes.
;;

;;; Code:
;;
;;

(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window)
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

;;; window.el ends here
