;; -*- lexical-binding: t; -*-

;;; This file bootstraps the configuration


;;----------------------------------------------------------------------------
;; Initialize package repositories
;;----------------------------------------------------------------------------
(setq load-prefer-newer t)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;----------------------------------------------------------------------------
;; Default encoding
;;----------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;;----------------------------------------------------------------------------
;; Initialize use-package
;;----------------------------------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;;----------------------------------------------------------------------------
;; Bootstrap general configuration
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;;----------------------------------------------------------------------------
;; Load and initialize all the packages and configs
;;----------------------------------------------------------------------------
(use-package bind-key :ensure t)
(use-package diminish :ensure t)
(dolist (file (directory-files
               (expand-file-name "packages" user-emacs-directory)
               :full "\\.el$"))
  (load file))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))
