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

;;
;; http://tuhdo.github.io/helm-projectile.html
;;
;; C-c p h    Helm interface to projectile
;; C-c p p    Switches to another projectile project
;; C-c p f    Lists all files in a project. C-u -> clear the cache first
;; C-c p F    Find file in all known projects
;; C-c p g    Find file based on context at point
;; C-c p d    Lists available directories in current project. C-u -> clear the cache first
;; C-c p e    Lists recently opened files in current project
;; C-c p a    Switch between files with same name but different extensions
;; C-c p i    Invalidate cache
;; C-c p z    Add the file of current selected buffer to cache
;; C-c p b    List all open buffers in current project
;;
;; C-c p R    Regenerates the projects TAGS file
;; C-c p D    Opens the root of the project in dired
;; C-c p c    Runs a standard compilation command for your type of project
;; C-c p P    Runs a standard test command for your type of project
;; C-c p j    Find tags and definitions
;; C-c p t    Toggle between implementation and test
;;
;; C-c p r    Runs interactive query-replace on all files in the project
;;
;; C-c p s g  Searches for symbol starting from project root
;; C-c p s a  Same as above but using ack
;; C-c p s s  Same as above but using ag
(use-package projectile
  :ensure t
  :demand
  :diminish ""

  :init
  (defun init-projectile-test-suffix (project-type)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond ((member project-type '(haskell-stack)) "Spec")
          (t (projectile-test-suffix project-type))))

  (setq projectile-create-missing-test-files t)
  (setq projectile-mode-line nil)
  (setq projectile-test-suffix-function #'init-projectile-test-suffix)
  (setq projectile-use-git-grep t)
  (setq projectile-indexing-method 'alien)
  ;;(setq projectile-enable-caching t)

  (make-variable-buffer-local 'projectile-tags-command)
  (projectile-mode))

(use-package helm-projectile
  :ensure t
  :demand

  :init
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

;;; projectile.el ends here
