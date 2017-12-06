;; Library for searching org files recursively.
(require 'find-lisp)

(use-package org
  :ensure t
  :defer t

  ;;:bind (("C-c l" . org-store-link)
  ;;       ("C-c a" . org-agenda))
  
  :init
  (setq org-hide-emphasis-markers t)
  (setq org-log-done 'time)
  (setq org-src-fontify-natively t)
  (setq org-startup-truncated nil)
  ;;(setq org-agenda-files
  ;;      (find-lisp-find-files "~/org" "\.org$"))

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
