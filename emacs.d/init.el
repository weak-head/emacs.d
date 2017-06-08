;;; init.el --- Emacs configuration of Oleksandr Zinchenko
;;
;;  Copyright (c) 2017 Oleksandr Zinchenko <zinchenko@live.com>
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;


;;; Commentary:
;;
;; This is my personal Emacs configuration.
;;


;;; License:
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Code:
;;

;;----------------------------------------------------------------------------;;
;;                        Package management                                  ;;
;;----------------------------------------------------------------------------;;

(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)


;;----------------------------------------------------------------------------;;
;;                        Initialize use-package                              ;;
;;                https://github.com/jwiegley/use-package                     ;;
;;----------------------------------------------------------------------------;;

;;(setq use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;----------------------------------------------------------------------------;;
;;                               Requires                                     ;;
;;----------------------------------------------------------------------------;;


(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)


;;----------------------------------------------------------------------------;;
;;                               Functions                                    ;;
;;----------------------------------------------------------------------------;;

;; https://www.emacswiki.org/emacs/ToggleWindowSplit
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


;;----------------------------------------------------------------------------;;
;;                                 Fonts                                      ;;
;;----------------------------------------------------------------------------;;

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


;;----------------------------------------------------------------------------;;
;;                              User interface                                ;;
;;----------------------------------------------------------------------------;;

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


;;----------------------------------------------------------------------------;;
;;                          General configuration                             ;;
;;----------------------------------------------------------------------------;;

;;(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;;(load custom-file)

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

;; Automatically revert all bufers every 5 seccons
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


;;----------------------------------------------------------------------------;;
;;                          Global key bindings                               ;;
;;----------------------------------------------------------------------------;;

(bind-key "C-c C-SPC" #'delete-trailing-whitespace)
(bind-key "C-x C-b" #'ibuffer)
(bind-key "C-x C-k" #'init-kill-buffer-current)
(bind-key "C-x |" #'toggle-window-split)
(bind-key "M-/" #'hippie-expand)
(bind-key "M-o" #'other-window) ;; Default C-x o
(bind-key "M-*" #'pop-tag-mark) ;; Pops back to M-.


;;----------------------------------------------------------------------------;;
;;                          General packages                                  ;;
;;----------------------------------------------------------------------------;;

(use-package company
  :ensure t
  :demand
  :diminish ""
  :init
  (setq company-idle-delay 0.3)
  (global-company-mode))


(use-package exec-path-from-shell
  :ensure t
  :defer t
  :if (memq window-system '(mac ns))

  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))


(use-package helm
  :ensure t
  :demand
  :diminish ""

  :bind (("C-M-y" . helm-show-kill-ring)
         ("C-h a" . helm-apropos)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("M-s o" . helm-occur)
         ("M-x" . helm-M-x)
         :map helm-map
         ([tab] . helm-execute-persistent-action))

  :init
  (setq helm-M-x-fuzzy-match t
        helm-apropos-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-ff-newfile-prompt-p nil
        helm-locate-fuzzy-match t
        helm-recentf-fuzzy-match t)
  (require 'helm-config)
  (helm-mode))


(use-package which-key
  :ensure t
  :demand
  :pin melpa

  :init
  (which-key-mode)

  :config
  (setq which-key-idle-delay 0.4)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)

   ; global map prefixes
  (which-key-add-key-based-replacements
    "C-c !" "flycheck"
    "C-c &" "yasnippet"
    "C-c f" "files"
    "C-c p" "projects"
    "C-c t" "toggle"))


(use-package dired
  :ensure nil
  :defer t

  :bind (:map dired-mode-map
              ("^" . up-dir-in-same-buf))

  :config
  (defun up-dir-in-same-buf ()
    "Up to parent directory in the same buffer."
    (interactive)
    (find-alternate-file ".."))

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; '-a' show all files
  ;; '-l' mandatory
  ;; '-h' human readable sizes
  ;; '-F' file-type classifiers
  (setq dired-listing-switches "-alhF")

  ;; mark links with @
  (setq dired-ls-F-marks-symlinks t)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t))


(use-package dired-x
  :defer nil
  :after dired

  :bind (("C-c f j" . dired-jump)
         ("C-x C-j" . dired-jump))

  :init
  (add-hook 'dired-mode-hook #'dired-omit-mode)

  :config
  (setq dired-omit-verbose nil)

  ;; OS X bsdtar is mostly compatible with GNU Tar
  (when (eq system-type 'darwin)
    (setq dired-guess-shell-gnutar "tar"))

  ;; Diminish dired-omit-mode. We need this hack, because Dired Omit Mode has
  ;; a very peculiar way of registering its lighter explicitly in
  ;; `dired-omit-startup'.  We can't just use `:diminish' because the lighter
  ;; isn't there yet after dired-omit-mode is loaded.
  (add-function :after (symbol-function 'dired-omit-startup)
                (lambda () (diminish 'dired-omit-mode " ⓞ"))
                '((name . dired-omit-mode-diminish))))


(use-package ibuffer
  :ensure t
  :defer t

  :init
  (defun init-ibuffer ()
    "Sets the default filter group for ibuffer."
    (ibuffer-auto-mode 1)
    (ibuffer-switch-to-saved-filter-groups "default-home"))

  (add-hook 'ibuffer-mode-hook #'init-ibuffer)

  :config
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-saved-filter-groups
        (quote (("default-home"
                 ("dired" (mode . dired-mode))
                 ("csharp" (or
                            (mode . csharp-mode)
                            (name . ".*\\.sln")
                            (name . ".*\\.csproj")))
                 ("haskell" (or
                             (mode . haskell-mode)
                             (mode . haskell-cabal-mode)
                             (filename . "stack\\.yaml")))
                 ("sql" (or
                         (name . "^\\*SQL\\*$")
                         (mode . sql-mode)))
                 ("markdown" (mode . markdown-mode))
                 ("java-script" (mode . js-mode))
                 ("shell-script" (or
                                  (mode . sh-mode)
                                  (mode . bat-mode)))
                 ("docker" (mode . dockerfile-mode))
                 ("yaml" (mode . yaml-mode))
                 ("emacs" (or
                           (name . "^\\*scratch\\*$")
                           (name . "^\\*Messages\\*$")
                           (name . "^\\*Help\\*$")
                           (name . "^\\*info\\*$")
                           (name . "^\\*Apropos\\*$")
                           (name . "^\\*Completions\\*$")
                           (name . "^\\*Compile-Log\\*$")
                           (filename . "\\.emacs")
                           (filename . "dot-emacs\\.el")
                           (filename . "\\.emacs\\.d")
                           (filename . "init\\.el")))
                 ("planner" (or
                             (name . "^\\*Calendar\\*$")
                             (name . "^diary$")
                             (mode . muse-mode)))
                 ("gnus" (or
                          (mode . message-mode)
                          (mode . bbdb-mode)
                          (mode . mail-mode)
                          (mode . gnus-group-mode)
                          (mode . gnus-summary-mode)
                          (mode . gnus-article-mode)
                          (name . "^\\.bbdb$")
                          (name . "^\\.newsrc-dribble")))
                 ("helm" (mode . helm-major-mode))))))

  (define-ibuffer-column size-h
    (:name "Size"
     :inline t)
    (cond
     ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
     ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
     (t (format "%8d" (buffer-size)))))

  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 35 35 :left :elide) " "
                (size-h 9 -1 :right) " "
                (mode 16 16 :left :elide) " "
                filename-and-process)
          (mark " " (name 16 -1) " " filename)))

  (unbind-key "M-o" ibuffer-mode-map))


(use-package ibuffer-vc
  :ensure t
  :defer t
  :disabled t

  :init
  (defun init-ibuffer-vc-groups ()
    "Inits vc groups for ibuffer"
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))

  (add-hook 'ibuffer-hook #'init-ibuffer-vc-groups))


(use-package ibuffer-projectile
  :ensure t
  :disabled t
  :defer t

  :init
  (add-hook 'ibuffer-hook #'ibuffer-projectile-set-filter-groups))


(use-package bug-hunter
  :ensure t)

;;----------------------------------------------------------------------------;;
;;                          Demo-it related packages                          ;;
;;----------------------------------------------------------------------------;;

(use-package demo-it
  :ensure t
  :defer t)


(use-package expand-region
  :ensure t
  :defer t
  :bind ("C-=" . er/expand-region))


(use-package fancy-narrow
  :ensure t
  :defer t)


(use-package org
  :ensure t
  :defer t
  :init
  (setq org-hide-emphasis-markers t
        org-log-done 'time
        org-src-fontify-natively t
        org-startup-truncated nil)

  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((emacs-lisp . t) (sh . t))))


(use-package org-bullets
  :ensure t
  :defer t
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))


(use-package org-tree-slide
  :ensure t
  :defer t)

;;----------------------------------------------------------------------------;;
;;                          Development packages                              ;;
;;----------------------------------------------------------------------------;;

(use-package compile
  :ensure t
  :defer t

  :init
  (setq compilation-scroll-output 'first-error)

  (defun init-compilation-colorize ()
    "Colorize compilation."
    (let ((inhibit-read-only t))
      (goto-char compilation-filter-start)
      (move-beginning-of-line nil)
      (ansi-color-apply-on-region (point) (point-max))))

  (add-hook 'compilation-filter-hook #'init-compilation-colorize))


(use-package etags
  :ensure t
  :bind (("M-." . init-goto-tag))

  :init
  (setq tags-revert-without-query t)

  :config
  (defun init-goto-tag ()
    "Jump to the definition."
    (interactive)
    (find-tag (find-tag-default))))


(use-package projectile
  :ensure t
  :demand
  :diminish ""

  :init
  (defun init-projectile-test-suffix (project-type)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond ((member project-type '(haskell-stack)) "Spec")
          (t (projectile-test-suffix project-type))))

  (setq projectile-create-missing-test-files t
        projectile-mode-line nil
        projectile-test-suffix-function #'init-projectile-test-suffix
        projectile-use-git-grep t)

  (make-variable-buffer-local 'projectile-tags-command)
  (projectile-mode))


(use-package helm-projectile
  :ensure t
  :demand

  :init
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))


(use-package flycheck
  :ensure t
  :demand
  :diminish ""
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error))

  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)

  :config
  (defun init-flycheck-may-enable-mode (f)
    "Disallow flycheck in special buffers."
    (interactive)
    (and (not (string-prefix-p "*" (buffer-name)))
         (apply (list f))))

  (advice-add 'flycheck-may-enable-mode :around
              #'init-flycheck-may-enable-mode))


(use-package magit
  :ensure t
  :defer t

  :init
  (setq magit-push-always-verify nil
        magit-revert-buffers t)
  (add-hook 'git-commit-mode-hook #'flyspell-mode))


(use-package paren
  :ensure t
  :defer t
  :init
  (show-paren-mode))


;;----------------------------------------------------------------------------;;
;;                        General prog mode packages                          ;;
;;----------------------------------------------------------------------------;;

(use-package yasnippet
  :ensure t
  :demand
  :diminish (yas-minor-mode . "")

  :init
  (add-to-list 'hippie-expand-try-functions-list #'yas-hippie-try-expand)
  (yas-global-mode)

  :config
  (defun init-yas-uncapitalize (cap)
    (concat (downcase (substring cap 0 1))
            (substring cap 1)))

  (unbind-key "TAB" yas-minor-mode-map)
  (unbind-key "<tab>" yas-minor-mode-map))


(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (dolist (hook '(text-mode-hook prog-mode-hook))
    (add-hook hook #'rainbow-delimiters-mode)))


(use-package nlinum
  :ensure t
  :bind (("C-c t l" . nlinum-mode)))


(use-package whitespace
  :ensure nil
  :bind (("C-c t w" . whitespace-mode))

  :config
  (setq whitespace-style '(face indentation space-after-tab
                                space-before-tab tab-mark
                                empty trailing lines-tail))
  (setq whitespace-line-column nil))


(use-package markdown-mode
  :ensure t
  :defer t)


(use-package dockerfile-mode
  :ensure t
  :defer t)


(use-package yaml-mode
  :ensure t
  :defer t)


(use-package sql
  :ensure t
  :defer t

  :init
  (setq sql-mysql-options '("-C" "-t" "-f" "-n"))
  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t))))


;;----------------------------------------------------------------------------;;
;;                          Haskell packages                                  ;;
;;----------------------------------------------------------------------------;;

(use-package haskell-mode
  :ensure t
  :defer t

  :bind (:map haskell-mode-map
              ("M-g i" . haskell-navigate-imports)
              ("M-g M-i" . haskell-navigate-imports))

  :init
  (setq haskell-compile-cabal-build-alt-command
        "cd %s && stack clean && stack build --ghc-options -ferror-spans"
        haskell-compile-cabal-build-command
        "cd %s && stack build --ghc-options -ferror-spans"
        haskell-compile-command
        "stack ghc -- -Wall -ferror-spans -fforce-recomp -c %s"))


(use-package haskell-snippets
  :ensure t
  :defer t)


(use-package hlint-refactor
  :ensure t
  :defer t
  :diminish ""

  :init
  (add-hook 'haskell-mode-hook #'hlint-refactor-mode))


(use-package intero
  :ensure t
  :defer t
  :diminish " λ"

  :bind (:map intero-mode-map
              ("M-." . init-intero-goto-definition))

  :init
  (defun init-intero ()
    "Enable Intero unless visiting a cached dependency."
    (if (and buffer-file-name
             (string-match ".+/\\.\\(stack\\|stack-work\\)/.+" buffer-file-name))
        (progn
          (eldoc-mode -1)
          (flycheck-mode -1))
      (intero-mode)
      (setq projectile-tags-command "codex update")))

  (add-hook 'haskell-mode-hook #'init-intero)

  :config
  (defun init-intero-goto-definition ()
    "Jump to the definition of the thing at point using Intero or etags."
    (interactive)
    (or (intero-goto-definition)
        (find-tag (find-tag-default))))

  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))


;;----------------------------------------------------------------------------;;
;;                           Dotnet packages                                  ;;
;;----------------------------------------------------------------------------;;

(use-package csharp-mode
  :ensure t
  :defer t)


(use-package omnisharp
  :ensure t
  :defer t

  :bind (:map omnisharp-mode-map
              ("M-." . omnisharp-go-to-definition))

  :init
  ;;(setq omnisharp-server-executable-path
  ;;      "/usr/share/omnisharp/OmniSharp"
  ;;      omnisharp--curl-executable-path
  ;;      "~/emacs-env/curl.exe")
  (push 'company-omnisharp company-backends)
  (add-hook 'csharp-mode-hook #'omnisharp-mode))


;;----------------------------------------------------------------------------;;
;;                          Enable Disabled Features                          ;;
;;----------------------------------------------------------------------------;;

;; https://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
;; We can use 'a' to open directory in the same buffer
(put 'dired-find-alternate-file 'disabled nil)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)


(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(add-to-list 'default-frame-alist '(cursor-color . "white"))

;;; init.el ends here
