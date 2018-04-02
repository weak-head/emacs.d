
;; Prerequisites:
;;
;;   # Either of these
;;   - pip install rope
;;   - pip install jedi
;;
;;   # flake8 for code checks
;;   - pip install flake8
;;
;;   # and autopep8 for automatic PEP8 formatting
;;   - pip install autopep8
;;
;;   # and yapf for code formatting
;;   - pip install yapf
;;
;;  - M-x elpy-config RET

(use-package elpy
  :ensure t
  :defer t

  :bind (:map elpy-mode-map
              ("M-."       . elpy-goto-definition)
              ("C-c i r c" . elpy-autopep8-fix-code))

  :init
  (elpy-enable)
  )
