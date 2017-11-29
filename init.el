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
(setq custom-file
      (expand-file-name "global/custom.el" user-emacs-directory))
(load custom-file)

;; Functions.
(load (expand-file-name "global/defun.el" user-emacs-directory))

;; UI.
(load (expand-file-name "global/ui.el" user-emacs-directory))

;; Common global config.
(load (expand-file-name "global/common.el" user-emacs-directory))

;; Global key bindings.
(load (expand-file-name "global/keys.el" user-emacs-directory))

;; Packages.
(dolist (file (directory-files
               (expand-file-name "packages" user-emacs-directory)
               :full "\\.el$"))
  (load file))


;;; init.el ends here
