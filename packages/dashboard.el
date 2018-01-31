;; Prerequisites:
;;  - [Windows specific]: https://ftp.wayne.edu/gnu/emacs/windows/
;;    >> emacs-25.3_1-x86_64.zip
;;    >> emacs-25-x86_64-deps.zip

(use-package dashboard
  :ensure t

  :init
  (require 'subr-x)
  (defun wh/emacs-logo-title ()
    "Generates the emacs logo title."
    (defun wh/get-nix-info (n)
      "Retrieves os release info"
      (nth 1 (split-string (nth n (split-string (shell-command-to-string "cat /etc/*-release") "\n")) "=")))
    (cond ((eq system-type 'windows-nt)
           (concat "GNU Emacs " emacs-version
                   " ~ "
                   (string-trim (shell-command-to-string "ver"))))
          ((eq system-type 'darwin) (concat "GNU Emacs " emacs-version))
          (t (concat "GNU Emacs " emacs-version
                     " ~ "
                     (wh/get-nix-info 0) " " (wh/get-nix-info 1)
                     " ~ "
                     "kernel " (car (split-string (shell-command-to-string "uname -r") "-"))
                     ))))

  (setq dashboard-banner-logo-title (wh/emacs-logo-title))
  (setq dashboard-startup-banner 'logo)

  (setq dashboard-items '((recents   . 5)
                          (bookmarks . 5)
                          (projects . 5)))

  :config
  (dashboard-setup-startup-hook))
