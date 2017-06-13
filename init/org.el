;;; org.el --- Org related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Org configuration.

;;; Code:

(use-package org
  :ensure t
  :defer t
  :init
  (setq org-hide-emphasis-markers t
        org-log-done 'time
        org-src-fontify-natively t
        org-startup-truncated nil)

  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((emacs-lisp . t) (sh . t))))

(use-package org-bullets
  :ensure t
  :defer t
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package org-tree-slide
  :ensure t
  :defer t)

;;; org.el ends here
