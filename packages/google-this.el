(use-package google-this
  :ensure t
  :diminish ""

  :config
  (global-set-key (kbd "C-c 8") 'google-this-mode-submap)
  (unbind-key "c" google-this-mode-submap) ;; translate query or region
  (unbind-key "a" google-this-mode-submap) ;; ray
  (unbind-key "e" google-this-mode-submap) ;; google error from compile log
  (unbind-key "f" google-this-mode-submap) ;; weather forecast
  (unbind-key "g" google-this-mode-submap) ;; lucky search
  (unbind-key "i" google-this-mode-submap) ;; lucky search + url
  (unbind-key "m" google-this-mode-submap) ;; google maps
  (unbind-key "r" google-this-mode-submap) ;; cpp ref
  (unbind-key "s" google-this-mode-submap) ;; symbol
  (unbind-key "t" google-this-mode-submap) ;; this (with confirmation)
  )


