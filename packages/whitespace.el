;;; whitespace.el --- Whitespace related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; whitespace mode configuration.
;;

;;; Code:
;;
;;

(use-package whitespace
  :ensure nil

  :bind (("C-c t w" . whitespace-mode))

  :config
  (setq whitespace-style '(face indentation space-after-tab
                                space-before-tab tab-mark
                                empty trailing lines-tail))
  (setq whitespace-line-column nil))

;;; whitespace.el ends here
