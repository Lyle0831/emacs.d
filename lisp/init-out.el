;;;init-out.el --- Load the configuration for some useful outside tools
;;; Commentray

;;;Code:

;;for anki
(use-package anki-editor
  :ensure t)

;;for latex

(use-package cdlatex
  :ensure t
  :config
  (add-hook 'latex-mode-hook 'turn-on-cdlatex))

(provide 'init-out)
