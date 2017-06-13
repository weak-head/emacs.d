;;; init.el --- Emacs configuration of Oleksandr Zinchenko -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:
;;
;; Emacs configuration of Oleksandr Zinchenko.
;;

;;; Code:


;;; Package management

(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)


;;; Initializing use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)


;;; Loading configuration

;; Store customizations in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Global configuration.
(load (expand-file-name "global.el" user-emacs-directory))

;; Load all init/*.el files.
(dolist (file (directory-files (expand-file-name "init" user-emacs-directory) :full "\\.el$"))
  (load file))


;;; Enabling some usefull features

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)


;;; init.el ends here
