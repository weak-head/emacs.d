;;; compile.el --- Configuration for compile. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Configuration for compile.
;;

;;; Code:
;;
;;

(use-package compile
  :ensure t
  :defer t

  :init
  (setq compilation-scroll-output 'first-error)

  (defun init-compilation-colorize ()
    "Colorize compilation."
    (let ((inhibit-read-only t))
      (goto-char compilation-filter-start)
      (move-beginning-of-line nil)
      (ansi-color-apply-on-region (point) (point-max))))

  (add-hook 'compilation-filter-hook #'init-compilation-colorize))

;;; compile.el ends here
