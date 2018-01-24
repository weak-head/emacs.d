;; Prerequisites:
;;
;;  - NodeJS
;;    $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
;;    $ nvm install v8
;;    $ nvm alias default v8
;;
;;  - Tern (http://ternjs.net/)
;;    $ npm install -g tern tern-lint
;;    >> .tern-project (http://ternjs.net/doc/manual.html#project_file)
;;
;;  - flycheck / eslint
;;    $ npm install -g eslint babel-eslint eslint-plugin-react
;;    >> .eslintrc (https://eslint.org/docs/user-guide/configuring)
;;

(use-package js2-mode
  :ensure t
  :defer t

  :mode "\\.js\\'"

  :config
  (define-key js2-mode-map (kbd "C-c C-o") nil)
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  )

(use-package js2-refactor
  :ensure t
  :defer t

  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)

  (js2r-add-keybindings-with-prefix "C-c i r")
  ;; TODO: define keys
  ;; or (js2r-add-keybindings-with-modifier "C-s-")
  ;; or (define-key js2-refactor-mode-map (kbd "C-c C-e C-f") 'js2r-extract-function)

  (setq js2-skip-preprocessor-directives t)

  (define-key js2-mode-map (kbd "C-k") #'js2r-kill))

(use-package tern
  :ensure t
  :defer t

  :config
  (add-hook 'js2-mode-hook (lambda () (tern-mode)))
  )

(use-package company-tern
  :ensure t
  :defer t

  :config
  (add-to-list 'company-backends 'company-tern))

(use-package indium
  :ensure t
  :defer t
  )
