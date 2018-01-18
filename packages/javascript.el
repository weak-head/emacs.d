;; Prerequisites:
;;
;;  - NodeJS
;;    $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
;;    $ nvm install v8
;;    $ nvm alias default v8
;;
;;  - Tern (http://ternjs.net/)
;;    $ npm install -g tern tern-lint
;;
;;  - flycheck / eslint
;;    $ npm install -g eslint babel-eslint eslint-plugin-react

(use-package js2-mode
  :ensure t

  :mode "\\.js\\'"

  :config
  (define-key js2-mode-map (kbd "C-c C-o") nil)
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

  ;; (defun js2-show-node-at-point ()
  ;;   (interactive)
  ;;   (js2-show-node (js2-node-at-point)))

  ;; (defun js2-show-node-parent-at-point ()
  ;;   (interactive)
  ;;   (js2-show-node (js2-node-parent (js2-node-at-point))))

  ;; (defun js2-show-node (node)
  ;;   (let* ((buf (get-buffer-create "*js2-node-at-point*"))
  ;;          (node-contents (buffer-substring (js2-node-abs-pos node) (js2-node-abs-end node))))
  ;;     (with-current-buffer
  ;;         (set-buffer buf)
  ;;       (delete-region (point-min) (point-max))
  ;;       (insert node-contents))))
  )

(use-package js2-refactor
  :ensure t

  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)

  (js2r-add-keybindings-with-prefix "C-c i r")
  ;; TODO: define keys
  ;; or (js2r-add-keybindings-with-modifier "C-s-")
  ;; or (define-key js2-refactor-mode-map (kbd "C-c C-e C-f") 'js2r-extract-function)

  (setq js2-skip-preprocessor-directives t)

  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;;  (define-key js-mode-map (kbd "M-.") nil)
  )

(use-package tern
  :ensure t

  :config
  (add-hook 'js2-mode-hook (lambda ()
                             (tern-mode)
                             (company-mode)))
  )

(use-package company-tern
  :ensure t

  :config
  (add-to-list 'company-backends 'company-tern))

(use-package indium
  :ensure t
  )
