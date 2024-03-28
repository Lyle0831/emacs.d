;;;init-out.el --- Load the configuration for some useful outside tools
;;; Commentray

;;;Code:

;;for anki
(use-package anki-editor
  :ensure t)

;;for latex
 	
(use-package tex
  :ensure auctex)

(use-package cdlatex
  :ensure t
  :config
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)                           ; turn on cdlatex
  (add-hook 'LaTeX-mode-hook (lambda() (company-mode 0))))      ; turn off company

(provide 'init-out)
