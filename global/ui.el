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
(use-package kaolin-themes
  :ensure t
  :disabled t
  :demand
  :init
  (load-theme 'kaolin-dark 'no-confirm))

;; Zenburn theme
;; https://emacsthemes.com/themes/zenburn-theme.html
(use-package zenburn-theme
  :ensure t
  :disabled t
  :demand
  :init
  (load-theme 'zenburn 'no-confirm))

;; Drakula theme
;; https://draculatheme.com/emacs/
(use-package dracula-theme
  :ensure t
  :disabled t
  :demand
  :init
  (load-theme 'dracula 'no-confirm))

;; Doom theme
;; https://github.com/hlissner/emacs-doom-themes
(use-package doom-themes
  :ensure t
  :demand

  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one 'no-confirm)
  (doom-themes-visual-bell-config)
  ;;(doom-themes-neotree-config)
  (doom-themes-org-config))

;; Speceline
;; https://github.com/TheBB/spaceline
(use-package spaceline
  :ensure t
  
  :init
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
        powerline-default-separator 'arrow)

  :config
  (spaceline-helm-mode)
  (spaceline-emacs-theme))

;; Full google fonts repo:
;;   https://github.com/google/fonts
(if (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
                      ;; :font "Roboto Mono"
                      :family "Roboto Mono"
                      :height 98
                      :weight 'normal
                      :width 'normal)
  (set-face-attribute 'default nil
                      :font "Source Code Pro"
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
