;;----------------------------------------------------------------------------
;; Ensure environment variables are up to date
;;----------------------------------------------------------------------------
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :if (memq window-system '(mac ns))

  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))


;;----------------------------------------------------------------------------
;; Basic preferences
;;----------------------------------------------------------------------------

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (and
       (not (eq system-type 'darwin))
       (fboundp 'menu-bar-mode))
  (menu-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(delete-selection-mode 1)
(blink-cursor-mode 0)
;;(global-auto-revert-mode t)

(setq column-number-mode t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil
      ring-bell-function 'ignore
      confirm-nonexistent-file-or-buffer nil
      w32-recognize-altgr nil
      kill-whole-line t
      confirm-kill-emacs 'y-or-n-p)

;; Simplify prompts.
(fset 'yes-or-no-p 'y-or-n-p)

;; No kill buffer confirmation.
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Running Emacs maximized.
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;----------------------------------------------------------------------------
;; Store auto-saves and backups in emacs.d/var
;;----------------------------------------------------------------------------
(let* ((vdir (expand-file-name "var" user-emacs-directory))
       (adir (expand-file-name "autosaves/" vdir))
       (ldir (expand-file-name "auto-save-list/" vdir))
       (bdir (expand-file-name "backups/" vdir)))
  (make-directory adir t)
  (make-directory bdir t)
  (setq auto-save-file-name-transforms `((".*" ,(concat adir "\\1") t))
        auto-save-list-file-prefix (concat ldir "/saves-")
        backup-directory-alist `((".*" . ,bdir))))


;;----------------------------------------------------------------------------
;; Automatically save and restore sessions
;;----------------------------------------------------------------------------
;;(desktop-save-mode t)
;;(setq ;desktop-dirname             "~/.emacs.d/"
;;      ;desktop-base-file-name      ".emacs.desktop"
;;      ;desktop-base-lock-name      ".emacs.desktop.lock"
;;      ;desktop-path                (list desktop-dirname)
;;      ;desktop-files-not-to-save   "\\(^/[^/:]*:\\|(ftp)$\\)"
;;      desktop-save                t
;;      desktop-load-locked-desktop t
;;      desktop-auto-save-timeout   30)


;;----------------------------------------------------------------------------
;; Default encoding
;;----------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;;----------------------------------------------------------------------------
;; Adjust indentation and line wrapping
;;----------------------------------------------------------------------------
(let ((spaces 2)
      (max-line-length 100))
  (setq-default fill-column max-line-length
                indent-tabs-mode nil
                tab-width spaces
                tab-stop-list (number-sequence spaces max-line-length spaces)))


;;----------------------------------------------------------------------------
;; Move cursor into between CamelCaseWords
;;----------------------------------------------------------------------------
(use-package subword
  :ensure nil
  :diminish ""

  :init
  (global-subword-mode 1))


;;----------------------------------------------------------------------------
;; Features disabled by default
;;----------------------------------------------------------------------------
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)


;;----------------------------------------------------------------------------
;; General defun
;;----------------------------------------------------------------------------

;; Removes ^M line endings from files with mixed UNIX and DOS line endings modes.
;; as option we can execute this for all files on load:
;;   (add-hook 'text-mode-hook 'remove-dos-eol)
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Kills the current buffer.
(defun init-kill-buffer-current ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

;; Copies the full path of the file in the active buffer.
(defun copy-buffer-file-path ()
  "Copies the full path of the file in the active buffer."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (let ((select-enable-clipboard t)) (kill-new filename))
      (message filename))))


;;----------------------------------------------------------------------------
;; General key bindings
;;----------------------------------------------------------------------------

;;(bind-key "C-c C-SPC" #'delete-trailing-whitespace)
(bind-key "C-x C-b" #'ibuffer)
(bind-key "C-x C-k" #'init-kill-buffer-current)
(bind-key "C-x |" #'toggle-window-split)
(bind-key "M-/" #'hippie-expand)
(bind-key "M-*" #'pop-tag-mark)
(bind-key "<f2>" (lambda ()
                   (interactive)
                   (find-file "~/.emacs.d/init.el")))
