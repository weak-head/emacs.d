;; Prerequisites:
;;  - [Windows specific]: https://ftp.wayne.edu/gnu/emacs/windows/
;;    >> emacs-25.3_1-x86_64.zip
;;    >> emacs-25-x86_64-deps.zip

(use-package dashboard
  :ensure t

  :init
  (defun wh/emacs-logo-title ()
    "Generates the emacs logo title."
    (cond ((eq system-type 'windows-nt) (concat "GNU Emacs: " emacs-version))
          ((eq system-type 'darwin) (concat "GNU Emacs: " emacs-version))
          (t (concat "GNU Emacs " emacs-version
                     "\n kernel " (car (split-string (shell-command-to-string "uname -r") "-"))
                     "\n "
                     (nth 1 (split-string (nth 0 (split-string (shell-command-to-string "cat /etc/*-release") "\n")) "="))
                     " "
                     (nth 1 (split-string (nth 1 (split-string (shell-command-to-string "cat /etc/*-release") "\n")) "="))
                     "" ))
          ))

  (setq dashboard-banner-logo-title (wh/emacs-logo-title))
  (setq dashboard-startup-banner 'logo)

  (setq dashboard-items '((recents   . 5)
                          (bookmarks . 5)
                          (projects . 5)))

  :config
  (dashboard-setup-startup-hook))
