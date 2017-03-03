
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives
'(("gnu" . "http://elpa.gnu.org/packages/")
 ("marmalade" . "http://marmalade-repo.org/packages/")
 ("melpa" . "http://melpa.milkbox.net/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(desktop-save-mode t)
 '(global-linum-mode nil)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(nil nil t)
 '(package-archives (quote (("gnu" . "http://melpa.org/packages/"))))
 '(package-selected-packages (quote (ghc haskell-mode buffer-move csharp-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Using M-o to switch between windows
;; Default shortcut is "C-x o"
(global-set-key (kbd "M-o") 'other-window)

;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)
