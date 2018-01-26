;; Prerequesites:
;;  - all-the-icons

;;----------------------------------------------------------------------------
;; Setup frame fonts
;;----------------------------------------------------------------------------

(if (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
                      ;; :font "Roboto Mono"
                      :family "Inconsolata" ;; Roboto Mono
                      :height 120
                      :weight 'normal
                      :width 'normal)
  (set-face-attribute 'default nil
                      ;;:font "Source Code Pro"
                      :family "monofur"
                      :height 120
                      :weight 'normal
                      :width 'normal))


;;----------------------------------------------------------------------------
;; Setup UI themes
;;----------------------------------------------------------------------------

;; https://emacsthemes.com/themes/kaolin-theme.html
(use-package kaolin-themes
  :ensure t
  :disabled t
  :demand

  :init
  (load-theme 'kaolin-dark 'no-confirm))

;; https://emacsthemes.com/themes/zenburn-theme.html
(use-package zenburn-theme
  :ensure t
  :disabled t
  :demand

  :init
  (load-theme 'zenburn 'no-confirm))

;; https://draculatheme.com/emacs/
(use-package dracula-theme
  :ensure t
  :disabled t
  :demand

  :init
  (load-theme 'dracula 'no-confirm))

;; https://github.com/hlissner/emacs-doom-themes
(use-package doom-themes
  :ensure t
  :demand

  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one 'no-confirm)
  (doom-themes-visual-bell-config)
  ;;(doom-themes-neotree-config)
  (doom-themes-org-config))

;; https://github.com/nashamri/spacemacs-theme
(use-package spacemacs-theme
  :ensure t
  :disabled t
  :demand

  :init
  (load-theme 'spacemacs-dark t)
  ;;(setq spacemacs-theme-org-agenda-height nil)
  ;;(setq spacemacs-theme-org-height nil)
  )


;;----------------------------------------------------------------------------
;; Setup power line
;;----------------------------------------------------------------------------

(use-package spaceline
  :ensure t
  :demand

  :init
  (require 'spaceline-config)
  (setq powerline-default-separator 'arrow)

  :config
  (spaceline-spacemacs-theme)
  ;;(spaceline-emacs-theme)
  (spaceline-helm-mode)
  )

(use-package spaceline-all-the-icons
  :ensure t
  :defer t
  :demand
  :disabled t

  :after spaceline

  :config
  (setq spaceline-all-the-icons-separator-type 'cup
        spaceline-all-the-icons-icon-set-modified 'toggle
        spaceline-all-the-icons-icon-set-flycheck-slim 'outline
        spaceline-all-the-icons-flycheck-alternate t
        spaceline-all-the-icons-highlight-file-name t
        spaceline-all-the-icons-hide-long-buffer-path t
        )

  (spaceline-all-the-icons--setup-neotree)

  (spaceline-all-the-icons-theme))
