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

         :map helm-map
         ([tab] . helm-execute-pers))

  :init
  (require 'helm-config)
  (unbind-key "C-x c")
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
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all)
         :map isearch-mode-map
         ("M-i" . helm-swoop-from-isearch)
         :map helm-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line)
         :map helm-multi-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line))
  
  :init
  (setq helm-swoop-use-fuzzy-match t)
  (setq helm-swoop-split-with-multiple-windows t)
  (setq helm-swoop-speed-or-color t))

(use-package helm-flx
  :ensure t
  :config
  (helm-flx-mode t))
