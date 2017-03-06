
;; Specifying to use MELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Installing zenburn theme if not installed
(unless (package-installed-p 'zenburn-theme) (package-install 'zenburn-theme))

;; loading the selected theme
(load-theme 'zenburn t)

;; Commonly used Sans-serif fonts review could be found here:
;;   https://spin.atomicobject.com/2016/07/11/programming-fonts/
;;
;; The fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
(set-frame-font "Menlo 12")

;; Using M-o to select next window
;; The default combination for this command is C-x o
(global-set-key (kbd "M-o") 'other-window)

;; Hidding redundant toolbar
(tool-bar-mode nil)
;; Hidding redundant scroolbar
(scroll-bar-mode nil)
;; Hidding menu bar
(menu-bar-mode nil)

;; Saving desktop sessions
(desktop-save-mode t)

;; IDO support
;;   https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)


