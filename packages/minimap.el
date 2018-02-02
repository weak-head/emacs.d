
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
                      :background "#a9a1e1"
                      :foreground "#a9a1e1") ;; dark gray
  (set-face-attribute 'minimap-active-region-background nil
                      :background "#5B6268") ;; light slate gray
  )
