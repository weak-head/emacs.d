;; My init file for emacs
;; Started in 2017

;; This layout is based on the one i've seen here:
;;   https://github.com/501st-alpha1/emacs-init/blob/master/init.el


;;----------------------------------------------------------------------------;;
;;                          Custom Load Path                                  ;;
;;----------------------------------------------------------------------------;;
;; Load path for various external libraries, managed with git.

;; TODO -> adopt this part

;; (unless (boundp 'my-external-library-location)
;;   (error "External library location not defined!"))

;; (add-to-list 'load-path my-external-library-location)

;; (let* ((my-lisp-dir my-external-library-location)
;;        (default-directory my-lisp-dir)
;;        (orig-load-path load-path))
;;   (setq load-path (cons my-lisp-dir nil))
;;   (normal-top-level-add-subdirs-to-load-path)
;;   (nconc load-path orig-load-path))


;;----------------------------------------------------------------------------;;
;;                          Install Packages                                  ;;
;;----------------------------------------------------------------------------;;

;; Adding MELPA repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'zenburn-theme) (package-install 'zenburn-theme))
(unless (package-installed-p 'markdown-mode) (package-install 'markdown-mode))
(unless (package-installed-p 'ghc) (package-install 'ghc))
(unless (package-installed-p 'haskell-mode) (package-install 'haskell-mode))
(unless (package-installed-p 'csharp-mode) (package-install 'csharp-mode))
(unless (package-installed-p 'omnisharp) (package-install 'omnisharp))
(unless (package-installed-p 'company) (package-install 'company))


;;----------------------------------------------------------------------------;;
;;                           Load Libraries                                   ;;
;;----------------------------------------------------------------------------;;
;; Load all needed libraries first
;; Using require so it is obvious when something breaks

(require 'company)
(require 'csharp-mode)
(require 'ghc)
(require 'haskell-mode)
(require 'ibuffer)
(require 'markdown-mode)
(require 'omnisharp)


;;----------------------------------------------------------------------------;;
;;                          Customize Styles                                  ;;
;;----------------------------------------------------------------------------;;

;; Loading the selected theme
(load-theme 'zenburn t)

;; Commonly used Sans-serif fonts review could be found here:
;;   https://spin.atomicobject.com/2016/07/11/programming-fonts/
;;
;; The fonts could be downloaded from here:
;;   https://github.com/hbin/top-programming-fonts
;; 
;;(set-frame-font "Menlo 12")

(set-face-attribute 'default nil
                    :family "Droid Sans Mono"
                    :height 120
                    :weight 'normal
                    :width 'normal)

;;----------------------------------------------------------------------------;;
;;                               Functions                                    ;;
;;----------------------------------------------------------------------------;;

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


;;----------------------------------------------------------------------------;;
;;                      Global Keyboard Shortcuts                             ;;
;;----------------------------------------------------------------------------;;

(global-set-key (kbd "M-o") 'other-window) ;; Default C-x o

(global-set-key (kbd "M-*") 'pop-tag-mark) ;; Pops back to M-. 

(global-set-key (kbd "C-x |") 'toggle-window-split)

;; Use ibuffer for buffer list
;;
;; More information about ibuffer could be found here:
;;   http://martinowen.net/blog/2010/02/03/tips-for-emacs-ibuffer.html
;;   https://www.emacswiki.org/emacs/IbufferMode
(global-set-key (kbd "C-x C-b") 'ibuffer) 


;;----------------------------------------------------------------------------;;
;;                          DotNet customization                              ;;
;;----------------------------------------------------------------------------;;

(setq omnisharp-server-executable-path "/usr/share/omnisharp/OmniSharp")
;;(setq omnisharp--curl-executable-path "~/emacs-env/curl.exe")

(define-key omnisharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)

(push 'company-omnisharp company-backends)

(add-hook 'csharp-mode-hook 'company-mode)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'linum-mode)


;;----------------------------------------------------------------------------;;
;;                         Haskell customization                              ;;
;;----------------------------------------------------------------------------;;

(add-hook 'haskell-mode-hook 'linum-mode)


;;----------------------------------------------------------------------------;;
;;                         ibuffer customization                              ;;
;;----------------------------------------------------------------------------;;

;; Hidding empty filter groups in ibuffer
(setq ibuffer-show-empty-filter-groups nil)

;; Disable confirmation for unsafe actions
;;(setq ibuffer-expert t)

;; Customizaing ibuffer grouping
(setq ibuffer-saved-filter-groups
      (quote (("default-home"
               ("dired" (mode . dired-mode))
               ("csharp" (mode . csharp-mode))
               ("haskell" (mode . haskell-mode))
	       ("sql" (or
                       (name . "*SQL*")
                       (mode . sql-mode)))
	       ("markdown" (mode . markdown-mode))
	       ("java-script" (mode . js-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
			 (filename . ".emacs")
			 (filename . "dot-emacs.el")
			 (filename . ".emacs.d")))
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


;;----------------------------------------------------------------------------;;
;;                SQL Interactive Mode Customization                          ;;
;;----------------------------------------------------------------------------;;

;; TODO: There are a few good examples here: https://www.emacswiki.org/emacs/SqlMode
;; but i want to keep it vanila as for now

;; - Windows specific -
;; This is required to make MySql work under Windows
(setq sql-mysql-options '("-C" "-t" "-f" "-n"))


;; We really want to have well formated tables without any truncated
;; lines, so this is must have option.
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;;----------------------------------------------------------------------------;;
;;                           Default-Frame-Alist                              ;;
;;----------------------------------------------------------------------------;;

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(add-to-list 'default-frame-alist '(cursor-color . "white"))


;;----------------------------------------------------------------------------;;
;;                          General Configuration                             ;;
;;----------------------------------------------------------------------------;;

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(desktop-save-mode t)
(winner-mode t)
(global-auto-revert-mode t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq indent-tabs-mode -1)

(column-number-mode 1)

(mouse-wheel-mode -1)

;; - Windows Specific -
;; C+M works: http://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Keyboard.html
(setq w32-recognize-altgr nil)
