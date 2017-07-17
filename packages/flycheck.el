;;; flycheck.el --- Configuration for flycheck. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Configuration for flycheck.
;;

;;; Code:
;;
;;

;;
;; C-c ! l   flycheck list errors
;;
;; Default:
;;   C-c ! p   previous error
;;   C-c ! n   next error
;;
;; Redefined:
;;   M-p    previous error
;;   M-n    next error
(use-package flycheck
  :ensure t
  :demand
  :diminish ""
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error))

  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)

  :config
  (defun init-flycheck-may-enable-mode (f)
    "Disallow flycheck in special buffers."
    (interactive)
    (and (not (string-prefix-p "*" (buffer-name)))
         (apply (list f))))

  (advice-add 'flycheck-may-enable-mode :around
              #'init-flycheck-may-enable-mode))

;;; flycheck.el ends here
