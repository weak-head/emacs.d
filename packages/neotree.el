;;; neotree.el --- Configuration for neotree mode. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; Neotree related configuration.
;;

;;; Code:
;;
;;

;; neotree uses the icons
;;   https://github.com/domtronn/all-the-icons.el
;;
;;  M-x all-the-icons-install-fonts
;;   > https://github.com/domtronn/all-the-icons.el/tree/master/fonts
(use-package all-the-icons
  :ensure t)

;;
(use-package neotree
  :ensure t

  :bind  ([f8] . neotree-project-dir)

  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;(setq neo-window-fixed-size 'nil)
  (setq neo-window-width 40))

;;; neotree.el ends here
