(use-package yasnippet
  :ensure t
  :defer t
  :diminish (yas-minor-mode . "")

  :init
  (add-to-list 'hippie-expand-try-functions-list #'yas-hippie-try-expand)
  (add-hook 'after-init-hook #'yas-global-mode)

  :config
  (defun init-yas-uncapitalize (cap)
    (concat (downcase (substring cap 0 1))
            (substring cap 1)))

  (unbind-key "TAB" yas-minor-mode-map)
  (unbind-key "<tab>" yas-minor-mode-map))
