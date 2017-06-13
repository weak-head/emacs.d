;;; csharp.el --- Configuration for csharp and dotnet. -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2017 Oleksandr Zinchenko
;;
;; Author: Oleksandr Zinchenko <zinchenko@live.com>
;; URL: TBD

;;; Commentary:

;; Configuration for csharp and dotnet.

;;; Code:

(use-package csharp-mode
  :ensure t
  :defer t)

(use-package omnisharp
  :ensure t
  :defer t

  :bind (:map omnisharp-mode-map
              ("M-." . omnisharp-go-to-definition))

  :init
  ;;(setq omnisharp-server-executable-path
  ;;      "/usr/share/omnisharp/OmniSharp"
  ;;      omnisharp--curl-executable-path
  ;;      "~/emacs-env/curl.exe")
  (push 'company-omnisharp company-backends)
  (add-hook 'csharp-mode-hook #'omnisharp-mode))

;;; csharp.el ends here
