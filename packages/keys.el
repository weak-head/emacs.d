(bind-key "C-c C-SPC" #'delete-trailing-whitespace)
(bind-key "C-x C-b" #'ibuffer)
(bind-key "C-x C-k" #'init-kill-buffer-current)
(bind-key "C-x |" #'toggle-window-split)
(bind-key "M-/" #'hippie-expand)

(bind-key "M-*" #'pop-tag-mark)

(bind-key "<f2>" (lambda ()
                   (interactive)
                   (find-file "~/.emacs.d/init.el")))
