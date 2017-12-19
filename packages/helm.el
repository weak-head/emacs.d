(use-package helm
  :ensure t
  :demand
  :diminish ""

  :bind (("C-M-y" . helm-show-kill-ring)
         ("C-h a" . helm-apropos)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("M-s o" . helm-occur)
         ("M-x" . helm-M-x)

         ("C-c h" . helm-command-prefix)
         :map helm-command-map
         ("s" . helm-multi-swoop-all)
         ("S" . helm-multi-swoop)

         :map helm-map
         ([tab] . helm-execute-pers))

  :init
  (require 'helm-config)

  (unbind-key "C-x c")
  (unbind-key "F" helm-command-map) ;; helm-select-xfont
  (unbind-key "/" helm-command-map) ;; helm-find
  (unbind-key "8" helm-command-map) ;; helm-ucs
  (unbind-key "@" helm-command-map) ;; helm-list-elisp-packages
  (unbind-key "a" helm-command-map) ;; helm-apropos
  (unbind-key "b" helm-command-map) ;; helm-resume
  (unbind-key "c" helm-command-map) ;; helm-colors
  (unbind-key "e" helm-command-map) ;; helm-etags-select
  ;;(unbind-key "f" helm-command-map) ;; helm-milti-files
  (unbind-key "l" helm-command-map) ;; helm-locate
  (unbind-key "m" helm-command-map) ;; helm-man-woman
  (unbind-key "p" helm-command-map) ;; helm-list-emacs-process
  (unbind-key "r" helm-command-map) ;; helm-regexp
  (unbind-key "s" helm-command-map) ;; helm-surfraw
  (unbind-key "t" helm-command-map) ;; helm-top
  (unbind-key "C-," helm-command-map) ;; helm-calcul-expression
  (unbind-key "C-:" helm-command-map) ;; helm-eval-expression
  (unbind-key "M-x" helm-command-map) ;; helm-M-x
  (unbind-key "M-y" helm-command-map) ;; helm-show-kill-ring
  (unbind-key "<tab>" helm-command-map) ;; helm-lisp-completion-at-point
  (unbind-key "C-c" helm-command-map)
  (unbind-key "C-x" helm-command-map)
  (unbind-key "M-g" helm-command-map)
  (unbind-key "M-s" helm-command-map)
  (unbind-key "h" helm-command-map)
  (define-key helm-command-map (kbd "ESC") nil)

  (setq helm-M-x-fuzzy-match t
        helm-apropos-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-ff-newfile-prompt-p nil
        helm-locate-fuzzy-match t
        helm-recentf-fuzzy-match t)

  (helm-mode))


(use-package helm-swoop
  :ensure t
  :demand

  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)

         :map isearch-mode-map
         ("M-i" . helm-swoop-from-isearch)

         :map helm-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line)

         :map helm-multi-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line))
  
  :init
  (setq helm-swoop-use-fuzzy-match t
        helm-swoop-split-with-multiple-windows t
        helm-swoop-speed-or-color t))


(use-package helm-ag
  :ensure t)


(use-package helm-flx
  :ensure t
  :config
  (helm-flx-mode t))
