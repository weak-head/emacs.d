;;; sql.el --- Sql related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Sql related configuration.

;;; Code:

(use-package sql
  :ensure t
  :defer t

  :init
  (setq sql-mysql-options '("-C" "-t" "-f" "-n"))
  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t))))

;;; sql.el ends here
