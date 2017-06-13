;;; ibuffer.el --- Ibuffer related configuration -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Ibuffer related configuration.

;;; Code:

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

;;; ibuffer.el ends here