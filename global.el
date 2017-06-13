;;; global.el --- Global configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko <zinchenko@live.com>
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD


;;; Commentary:
;;
;; This file contains:
;;   - general Emacs configuration
;;   - UI configuration, fonts and themes
;;   - function definitions
;;   - global key bindings
;;


;;; Code:
;;
;;


;;; Functions

;; Toggles the window split. Works well for 2 windows.
(defun toggle-window-split ()
  "If the frame is split vertically, split it horizontally or vice versa."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))


;; Removes ^M line endings from files with mixed UNIX and DOS line endings modes.
;; as option we can execute this for all files on load:
;;   (add-hook 'text-mode-hook 'remove-dos-eol)
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(defun init-kill-buffer-current ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))



;;; User interface

;; Get rid of tool bar, menu bar and scrool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (and (not (eq system-type 'darwin)) (fboundp 'menu-bar-mode))
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))


(use-package zenburn-theme
  :ensure t
  :demand
  :init
  ;; Increase background contrast.
  (defvar zenburn-override-colors-alist
    '(("zenburn-bg-1"     . "#101010")
      ("zenburn-bg-05"    . "#202020")
      ("zenburn-bg"       . "#2B2B2B")
      ("zenburn-bg+05"    . "#383838")
      ("zenburn-bg+1"     . "#3F3F3F")
      ("zenburn-bg+2"     . "#494949")
      ("zenburn-bg+3"     . "#4F4F4F")))

  (load-theme 'zenburn 'no-confirm))


;; Commonly used Sans-serif fonts review could be found here:
;;   https://spin.atomicobject.com/2016/07/11/programming-fonts/
;;
;; Another subjective font rating:
;;   https://www.narga.net/top-best-programing-fonts/
;;
;; The fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
;;
;; Set font for the frame:
;; (set-frame-font "Menlo 12")
;;
;; The fonts to consider:
;;  - Menlo
;;  - Courier New
;;  - Droid Sans Mono
;;  - Consolas
;;  - DejaVu Sans Mono
;;  - Monaco
;;  - 3270Medium
;;  - Inconsolata
;;  - Anonymous Pro
;;  - Terminus
;;  - Source Code Pro
;;  - Bitstream Vera Sans Mono
;;  - Envy Code R
;;  - Monofur
;;
;; My preferred font heights:
;;  - [98 - 120]
(set-face-attribute 'default nil
                    :family "Droid Sans Mono"
                    :height 98
                    :weight 'normal
                    :width 'normal)


;; Prevent accidental Emacs closure.
(setq confirm-kill-emacs 'y-or-n-p)


;; Simplify prompts.
(fset 'yes-or-no-p 'y-or-n-p)


;; Reduce UI noise.
(setq confirm-nonexistent-file-or-buffer nil
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil
      kill-buffer-query-functions (remq 'process-kill-buffer-query-function kill-buffer-query-functions)
      ring-bell-function 'ignore)


(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(add-to-list 'default-frame-alist '(cursor-color . "white"))



;;; General configuration

;; Ensure environment variables are up to date.
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :if (memq window-system '(mac ns))

  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))


;; Store customizations in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


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

;; stop creating backup~ files
;;(setq make-backup-files nil)

;; stop creating #autosave# files
;;(setq auto-save-default nil)


;; Display column number in modeline.
(setq column-number-mode t)

;; Collect garbage less frequently.
(setq gc-cons-threshold 104857600)

;; - Windows Specific -
;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
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
;;(winner-mode t)

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



;;; Global key bindings

(bind-key "C-c C-SPC" #'delete-trailing-whitespace)
(bind-key "C-x C-b" #'ibuffer)
(bind-key "C-x C-k" #'init-kill-buffer-current)
(bind-key "C-x |" #'toggle-window-split)
(bind-key "M-/" #'hippie-expand)
(bind-key "M-o" #'other-window)
(bind-key "M-*" #'pop-tag-mark)


;;; global.el ends here
