
;; Postconfigure:
;;  - (pdf-tools-install)
;;

(use-package pdf-tools
  :ensure t
  :defer t

  :init
  (pdf-tools-install)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))
