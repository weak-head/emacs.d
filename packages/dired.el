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

  :commands (dired-jump
             dired-jump-other-window
             dired-omit-mode)

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
                (lambda () (diminish 'dired-omit-mode ""))
                '((name . dired-omit-mode-diminish))))
