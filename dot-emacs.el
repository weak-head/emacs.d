;; Adding MELPA repository
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
;; Installing csharp-mode
(unless (package-installed-p 'csharp-mode) (package-install 'csharp-mode))
;; Installing omnisharp mode
(unless (package-installed-p 'omnisharp) (package-install 'omnisharp))
;; Installing company mode
(unless (package-installed-p 'company) (package-install 'company))


;; Loading the selected theme
(load-theme 'zenburn t)


;; Commonly used Sans-serif fonts review could be found here:
;;   https://spin.atomicobject.com/2016/07/11/programming-fonts/
;;
;; The fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
;;(set-frame-font "Menlo 12")


;;-----------------------------------------------------
;;--              omnisharp customization            --
;;-----------------------------------------------------

(if (require 'omnisharp nil 'noerror)
    (progn
      (require 'company)
      ;;(setq omnisharp--curl-executable-path "~/emacs-env/curl.exe")
      (setq omnisharp-server-executable-path "/path/to/OmniSharp.exe")
      (push 'company-omnisharp company-backends)
      (add-hook 'csharp-mode-hook 'company-mode)
      (add-hook 'csharp-mode-hook 'omnisharp-mode)
      (add-hook 'csharp-mode-hook 'linum-mode)
      (define-key omnisharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)
      )
  )

;;-----------------------------------------------------
;;--                ibuffer customization            --
;;-----------------------------------------------------

;; ibuffer should be preloaded in order to make this work.
(require 'ibuffer)

;; Use ibuffer for buffer list
;;
;; More information about ibuffer could be found here:
;;   http://martinowen.net/blog/2010/02/03/tips-for-emacs-ibuffer.html
;;   https://www.emacswiki.org/emacs/IbufferMode
(global-set-key (kbd "C-x C-b") 'ibuffer) 


;; Hidding empty filter groups in ibuffer
(setq ibuffer-show-empty-filter-groups nil)


;; Disable confirmation for unsafe actions
;;(setq ibuffer-expert t)


;; TODO: re-define this
;; Customizaing ibuffer grouping
(setq ibuffer-saved-filter-groups
      (quote (("default-home"
               ("dired" (mode . dired-mode))
               ("csharp" (mode . csharp-mode))
               ("haskell" (mode . haskell-mode))
               ("sql" (or
                       (name . "*SQL*")
                       (mode . sql-mode)))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("emacs-config" (or
                                (filename . ".emacs")
                                (filename . "dot-emacs.l")
                                (filename . ".emacs.d")))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))


;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size"
   :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))


;; Modify the default ibuffer-formats
;; Using 35 chars for the buffer name
;; and setting new size-h column
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 35 35 :left :elide) " "
              (size-h 9 -1 :right) " "
              (mode 16 16 :left :elide) " "
              filename-and-process)
	    (mark " " (name 16 -1) " " filename)))


;; Adding hook for the custom grouping defined abowe
(add-hook 'ibuffer-mode-hook
          (lambda ()
            ;; keeps the buffer list up to date
            (ibuffer-auto-mode 1)
            ;; I am using M-o for switcing between windows
            ;; and this combination is used by ibuffer
            ;; so unsetting it localy
            (local-unset-key (kbd "M-o"))
            (ibuffer-switch-to-saved-filter-groups "default-home")))


;;-----------------------------------------------------
;;--         sql interactive mode customization      --
;;-----------------------------------------------------


;; We really want to have well formated tables without any truncated
;; lines, so this is must have option.
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;; TODO: There are a few good examples here: https://www.emacswiki.org/emacs/SqlMode
;; but i want to keep it vanila as for now

;;-----------------------------------------------------
;;--          Toggle Window Split                    --
;;-----------------------------------------------------

;; This implementation is coming from here:
;; https://www.emacswiki.org/emacs/ToggleWindowSplit
(defun toggle-window-split ()
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

;; Using C-x | to toogle window direction.
(global-set-key (kbd "C-x |") 'toggle-window-split)

;;-----------------------------------------------------
;;--                                                 --
;;-----------------------------------------------------


;; Using M-o to select next window
;; The default combination for this command is C-x o
(global-set-key (kbd "M-o") 'other-window)

;; Pops back to where M-. was last invoked
(global-set-key (kdb "M-*") 'pop-tag-mark)


;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save-mode t)
 '(global-auto-revert-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(winner-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
