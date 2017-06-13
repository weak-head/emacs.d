;;; git.el --- Configuration for git. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Git related configuration.

;;; Code:

(use-package git-gutter
  :ensure t
  :demand
  :diminish ""
  
  :init
  (setq git-gutter:diff-option "-w")
  (add-hook 'after-init-hook
            (lambda ()
              (global-git-gutter-mode 1))))

(use-package git-link
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t

  :init
  (setq magit-push-always-verify nil
        magit-revert-buffers t)
  (add-hook 'git-commit-mode-hook #'flyspell-mode))

;;; git.el ends here
