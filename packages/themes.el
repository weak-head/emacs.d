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
  :disabled t
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

;;--------------------------
;; Light variants
;;--------------------------

;; https://github.com/purcell/color-theme-sanityinc-tomorrow
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :demand

  :init
  (load-theme 'sanityinc-tomorrow-day t))

;;----------------------------------------------------------------------------
;; Setup power line
;;----------------------------------------------------------------------------

(use-package telephone-line
  :ensure t
  :demand
  :disabled t

  :init
  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
        telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
        telephone-line-primary-right-separator 'telephone-line-cubed-right
        telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
  (setq telephone-line-height 24
        telephone-line-evil-use-short-tag t)

  (telephone-line-mode 1))

(use-package spaceline
  :ensure t
  :demand
;;  :disabled t

  :init
  (require 'spaceline-config)
  (setq powerline-default-separator 'arrow)

  :config
  ;;(spaceline-spacemacs-theme)
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
