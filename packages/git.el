(use-package git-gutter
  :ensure t
  :defer t
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

  :bind (("C-c g s" . magit-status)
         ("C-c g l" . magit-log-all)
         ("C-c g d" . magit-diff)

         ("C-c g t" . magit-stage-file)
         ("C-c g u" . magit-unstage-file)
         ("C-c g a" . magit-commit-amend)
         ("C-c g c" . magit-commit)

         ("C-c g b" . magit-branch)

         ("C-c g m" . magit-merge)
         ("C-c g r" . magit-rebase)

         ("C-c g f" . magit-fetch)
         ("C-c g P" . magit-pull)
         ("C-c g p" . magit-push))

  :init
  (setq magit-push-always-verify nil
        magit-revert-buffers t)
  (add-hook 'git-commit-mode-hook #'flyspell-mode))

(use-package ssh-agency
  :ensure t

  :init
  (setenv "SSH_ASKPASS" "git-gui--askpass"))
