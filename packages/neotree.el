;; Prerequesites:
;;  - https://github.com/domtronn/all-the-icons.el/tree/master/fonts
;;

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t

  :bind  ([f8] . wh/neotree-project-dir)

  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;(setq neo-window-fixed-size 'nil)
  (setq neo-window-width 40)

  (defun wh/neotree-project-dir ()
    "Open NeoTree using projectile root or toggle neotree if outside of a project."
    (interactive)
    (condition-case nil
        (let ((project-dir (projectile-project-root))
              (file-name (buffer-file-name)))
          (neotree-toggle)
          (if project-dir
              (if (neo-global--window-exists-p)
                  (progn
                    (neotree-dir project-dir)
                    (neotree-find file-name)))
            (message "Could not find project root.")))
      (error (neotree-toggle))))
  )
