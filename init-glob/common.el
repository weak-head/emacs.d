;;; common.el --- Common Emacs configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; This file contains common global Emacs configuration.
;;

;;; Code:
;;
;;

;; Ensure environment variables are up to date.
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :if (memq window-system '(mac ns))

  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

;; Store auto-saves and backups in emacs.d/var.
(let* ((vdir (expand-file-name "var" user-emacs-directory))
       (adir (expand-file-name "autosaves/" vdir))
       (ldir (expand-file-name "auto-save-list/" vdir))
       (bdir (expand-file-name "backups/" vdir)))
  (make-directory adir t)
  (make-directory bdir t)
  (setq auto-save-file-name-transforms `((".*" ,(concat adir "\\1") t))
        auto-save-list-file-prefix (concat ldir "/saves-")
        backup-directory-alist `((".*" . ,bdir))))

;; Memory threshold for GC
(setq gc-cons-threshold 100000000)

;; -- Windows Specific --
;; C+M works:
;;   http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)

;; Delete the trailing newline.
(setq kill-whole-line t)

;; Adjust indentation and line wrapping.
(let ((spaces 2)
      (max-line-length 100))
  (setq-default fill-column max-line-length
                indent-tabs-mode nil
                tab-width spaces
                tab-stop-list (number-sequence spaces max-line-length spaces)))

;; Open URLs within Emacs.
(when (package-installed-p 'eww)
  (setq browse-url-browser-function 'eww-browse-url))

;; Move cursor into between CamelCaseWords.
(global-subword-mode 1)

;; Undo and Redo changes in the window configuration
;; with 'C-c left' and 'C-c right'
(winner-mode t)

;; Automatically revert all bufers every 5 seconds
;; if associated file has changed.
;;(global-auto-revert-mode t)

;; Automatically save and restore sessions
;;(desktop-save-mode t)
;;(setq ;desktop-dirname             "~/.emacs.d/"
;;      ;desktop-base-file-name      ".emacs.desktop"
;;      ;desktop-base-lock-name      ".emacs.desktop.lock"
;;      ;desktop-path                (list desktop-dirname)
;;      ;desktop-files-not-to-save   "\\(^/[^/:]*:\\|(ftp)$\\)"
;;      desktop-save                t
;;      desktop-load-locked-desktop t
;;      desktop-auto-save-timeout   30)


;;; -- Enabling some usefull features --
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;;; common.el ends here
