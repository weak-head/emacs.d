
;; Postconfigure:
;;  - (pdf-tools-install)
;;

(use-package pdf-tools
  :ensure t
  :defer t

  :mode ("\\.pdf\\'" . pdf-view-mode)

  ;:init
  ;;(pdf-tools-install)
  )
