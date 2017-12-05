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
