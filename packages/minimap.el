(use-package minimap
  :ensure t
  :diminish "mm"

  :bind ("C-c t m" . minimap-mode)

  :config
  (set-face-attribute 'minimap-active-region-background nil
                      :background "light slate gray")
  )
