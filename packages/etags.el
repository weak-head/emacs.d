(use-package etags
  :ensure t
  :bind (("M-." . init-goto-tag))

  :init
  (setq tags-revert-without-query t)

  :config
  (defun init-goto-tag ()
    "Jump to the definition."
    (interactive)
    (find-tag (find-tag-default))))