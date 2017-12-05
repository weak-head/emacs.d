(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t

  :bind  ([f8] . neotree-project-dir)

  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;(setq neo-window-fixed-size 'nil)
  (setq neo-window-width 40))
