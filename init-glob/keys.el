;;; keys.el --- Global key bindings. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD
;;

;;; Commentary:
;;
;; This file contains global key bindings.
;;

;;; Code:
;;
;;

(bind-key "C-c C-SPC" #'delete-trailing-whitespace)
(bind-key "C-x C-b" #'ibuffer)
(bind-key "C-x C-k" #'init-kill-buffer-current)
(bind-key "C-x |" #'toggle-window-split)
(bind-key "M-/" #'hippie-expand)

;; C-x o
(bind-key "M-o" #'other-window)

;; M-.
(bind-key "M-*" #'pop-tag-mark)

;;; keys.el ends here
