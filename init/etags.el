;;; etags.el --- Configuration for etags. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Etags configuration.

;;; Code:

(use-package etags
  :ensure t
  :bind (("M-." . init-goto-tag))

  :init
  (setq tags-revert-without-query t)

  :config
  (defun init-goto-tag ()
    "Jump to the definition."
    (interactive)
    (find-tag (find-tag-default))))

;;; etags.el ends here
