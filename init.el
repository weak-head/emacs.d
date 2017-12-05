;;; init.el --- Emacs configuration of Oleksandr Zinchenko -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Emacs configuration of Oleksandr Zinchenko.
;;

;;; Code:
;;
;;


;;; -- Package management --

(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)


;;; -- Initializing use-package --

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package bind-key :ensure t)
(use-package diminish :ensure t)


;;; -- Loading configuration --

;; Customizations goes into separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Packages.
(dolist (file (directory-files
               (expand-file-name "packages" user-emacs-directory)
               :full "\\.el$"))
  (load file))

(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
