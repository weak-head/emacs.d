
;; The original minimap is not well-maintained any more.
;; I've grabbed the one from the `https://github.com/br0ns/minimap' repo.
;; It has a fix for the highlight line, ability to customize the line face and
;; a way to hide the mode line.
(use-package minimap
  :load-path "external-modules"
  :diminish "mm"

  :bind ("C-c t m" . minimap-mode)

  :config
  ;; (setq minimap-highlight-line nil)
  ;; (setq minimap-show-mode-line nil)

  (set-face-attribute 'minimap-highlight-line-face nil
                      :background "#5c656d"
                      :foreground "#a9a1e1")
  (set-face-attribute 'minimap-active-region-background nil
                      :background "#43484c")
  )
