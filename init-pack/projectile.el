;;; projectile.el --- Projectile related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Projectile configuration.
;;

;;; Code:
;;
;;

(use-package projectile
  :ensure t
  :demand
  :diminish ""

  :init
  (defun init-projectile-test-suffix (project-type)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond ((member project-type '(haskell-stack)) "Spec")
          (t (projectile-test-suffix project-type))))

  (setq projectile-create-missing-test-files t
        projectile-mode-line nil
        projectile-test-suffix-function #'init-projectile-test-suffix
        projectile-use-git-grep t)

  (make-variable-buffer-local 'projectile-tags-command)
  (projectile-mode))

(use-package helm-projectile
  :ensure t
  :demand

  :init
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

;;; projectile.el ends here
