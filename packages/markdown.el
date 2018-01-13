
;; Prerequisites:
;;   - pandoc

(use-package markdown-mode
  :ensure t
  :defer t

  :commands (markdown-mode gfm-mode)

  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))

  :init (setq markdown-command "pandoc")

  :config
  (add-hook 'gfm-mode-hook
            (lambda () (visual-line-mode 1)))
  )
