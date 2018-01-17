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
