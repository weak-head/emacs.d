
;; Specifying to use MELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Installing zenburn theme
(unless (package-installed-p 'zenburn-theme) (package-install 'zenburn-theme))
;; Installing markdown-mode
(unless (package-installed-p 'markdown-mode) (package-install 'markdown-mode))
;; Installing ghc
(unless (package-installed-p 'ghc) (package-install 'ghc))
;; Installing haskell-mode
(unless (package-installed-p 'haskell-mode) (package-install 'haskell-mode))

;; loading the selected theme
(load-theme 'zenburn t)

;; Commonly used Sans-serif fonts review could be found here:
;;   https://spin.atomicobject.com/2016/07/11/programming-fonts/
;;
;; The fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
;;(set-frame-font "Menlo 12")

;; Using M-o to select next window
;; The default combination for this command is C-x o
(global-set-key (kbd "M-o") 'other-window)

;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
