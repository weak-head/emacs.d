;;; ui.el --- UI configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; This file contains:
;;  - general UI configuration
;;  - fonts
;;  - themes
;;

;;; Code:
;;
;;

;; Kaolin theme
;; https://emacsthemes.com/themes/kaolin-theme.html
(use-package kaolin-theme
  :ensure t
  :demand
  
  :init
  (load-theme 'kaolin 'no-confirm))

;; Good old zenburn theme
;; https://emacsthemes.com/themes/zenburn-theme.html
(use-package zenburn-theme
  :ensure t
  :demand
  :disabled t

  :init
  ;; Increase background contrast.
  ;; (defvar zenburn-override-colors-alist
  ;;   '(("zenburn-bg-1"     . "#101010")
  ;;     ("zenburn-bg-05"    . "#202020")
  ;;     ("zenburn-bg"       . "#2B2B2B")
  ;;     ("zenburn-bg+05"    . "#383838")
  ;;     ("zenburn-bg+1"     . "#3F3F3F")
  ;;     ("zenburn-bg+2"     . "#494949")
  ;;     ("zenburn-bg+3"     . "#4F4F4F")))

  (load-theme 'zenburn 'no-confirm))

;; My favorite fonts:
;;  - Consolas
;;  - Droid Sans Mono
;;  - Inconsolata
;;  - Source Code Pro light
;;  - Ubuntu Mono
;;
;; Other fonts:
;;  - 3270Medium
;;  - Anonymous Pro
;;  - Bitstream Vera Sans Mono
;;  - Courier New
;;  - DejaVu Sans Mono
;;  - Envy Code R
;;  - Menlo
;;  - Monaco
;;  - Monofur
;;  - Terminus
;;
;; Variable-width fonts:
;;  - Purisa
;;
;; Some basic fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
;;
;; Full google fonts repo:
;;   https://github.com/google/fonts
(if (eq system-type 'windows-nt)
    ;; Consolas looks good and consistent on Windows
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 98
                      :weight 'normal
                      :width 'normal)
    ;; For any other OS I would like to use Sorce Code Pro
  (set-face-attribute 'default nil
                      :family "Source Code Pro light"
                      :height 98
                      :weight 'normal
                      :width 'normal))

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

;; No cursor blinking.
(blink-cursor-mode 0)

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
