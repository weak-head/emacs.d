;;; nlinum.el --- Configuration for linum mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Linum mode configuration.
;;

;;; Code:
;;
;;

(use-package nlinum
  :ensure t
  :bind (("C-c t l" . nlinum-mode)))

;;; nlinum.el ends here
