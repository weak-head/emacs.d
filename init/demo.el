;;; demo-it.el --- Configuration for demo and related packages. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Demo configuration.

;;; Code:

(use-package demo-it
  :ensure t
  :defer t)

(use-package expand-region
  :ensure t
  :defer t
  :bind ("C-=" . er/expand-region))

(use-package fancy-narrow
  :ensure t
  :defer t)

;;; demo-it.el ends here
