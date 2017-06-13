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

(require 'bind-key)
(require 'diminish)


;;; -- Loading configuration --

;; Customizations goes into separate file.
(setq custom-file
      (expand-file-name "init-glob/custom.el" user-emacs-directory))
(load custom-file)

;; Functions.
(load (expand-file-name "init-glob/defun.el" user-emacs-directory))

;; UI.
(load (expand-file-name "init-glob/ui.el" user-emacs-directory))

;; Common global config.
(load (expand-file-name "init-glob/common.el" user-emacs-directory))

;; Global key bindings.
(load (expand-file-name "init-glob/keys.el" user-emacs-directory))

;; Packages.
(dolist (file (directory-files
               (expand-file-name "init-pack" user-emacs-directory)
               :full "\\.el$"))
  (load file))


;;; init.el ends here
