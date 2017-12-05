(use-package sql
  :ensure t
  :defer t

  :init
  (setq sql-mysql-options '("-C" "-t" "-f" "-n"))
  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t))))
