;;; pdf.el --- Configuration for pdf mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Configuration for pdf mode.
;;
;; Prerequisites:
;;  apt install libpng-dev libz-dev libpoppler-glib-dev libpoppler-private-dev
;;
;; M-x pdf-tools-install

;;; Code:
;;
;;

;; https://github.com/politza/pdf-tools
(use-package pdf-tools
  :ensure t
  :demand
  :diminish "")

;;; pdf.el ends here
