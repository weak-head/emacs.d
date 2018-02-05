(use-package bm
  :ensure t
  :demand t

  :bind (("<f5>"   . bm-next)
         ("S-<f5>" . bm-previous)
         ("C-<f5>" . bm-toggle))

  :init
  (setq bm-restore-repository-on-load t)

  :config
  (setq bm-cycle-all-buffers t)
  (setq bm-repository-file "~/.emacs.d/bookmarks-bm")

  ;; http://raebear.net/comp/emacscolors.html
  ;; Mix:
  ;;  :fg "white" :bg "brown"
  ;;  :fg "white" :bg "IndianRed4"
  ;;  :fg "white" :bg "VioletRed4"
  ;;  :fg "white" :bg "magenta4"
  ;;  :fg "white" :bg "plum4"
  ;;  :fg "white" :bg "purple4"
  ;;
  (setq  bm-persistent-face '(:foreground "white" :background "purple4"))

  (setq-default bm-buffer-persistence t)

  (add-hook' after-init-hook 'bm-repository-load)
  (add-hook 'find-file-hooks 'bm-buffer-restore)
  (add-hook 'kill-buffer-hook #'bm-buffer-save)

  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))

  ;; The `after-save-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state.
  (add-hook 'after-save-hook #'bm-buffer-save)

  ;; Restoring bookmarks
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)

  ;; The `after-revert-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state. This hook might cause trouble when using packages
  ;; that automatically reverts the buffer (like vc after a check-in).
  ;; This can easily be avoided if the package provides a hook that is
  ;; called before the buffer is reverted (like `vc-before-checkin-hook').
  ;; Then new bookmarks can be saved before the buffer is reverted.
  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save)
  )
