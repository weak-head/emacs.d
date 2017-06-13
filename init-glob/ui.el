;;; ui.el --- UI configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; This file contains UI configuration, fonts and themes.
;;

;;; Code:
;;
;;

;; Using the UI theme
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

;; No tool bar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; No menu bar.
(when (and
       (not (eq system-type 'darwin))
       (fboundp 'menu-bar-mode))
  (menu-bar-mode -1))

;; No scroll bar.
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Display column number in modeline.
(setq column-number-mode t)

;; Prevent accidental Emacs closure.
(setq confirm-kill-emacs 'y-or-n-p)

;; Simplify prompts.
(fset 'yes-or-no-p 'y-or-n-p)

;; No confirmation for new file or buffer.
(setq confirm-nonexistent-file-or-buffer nil)

;; No welcome screen.
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; No *scratch* message.
(setq initial-scratch-message nil)

;; No ringing the bell.
(setq ring-bell-function 'ignore)

;; No kill buffer confirmation.
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Running Emacs maximized.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; ui.el ends here
