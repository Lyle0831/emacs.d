;;; init-themes.el --- Load the configuration for themes
;;; Commentary:

;; use doom-moonlight theme now

;;;Code:

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t   ; if nil, italics is universally disabled
	doom-themes-padded-modeline t); if nil no pad in modeline
  
  (load-theme 'doom-moonlight t)
  ;(load-theme 'doom-tomorrow-day t)

  (doom-themes-org-config)) ;make org file look better, not seen any change now

(provide 'init-themes)
;;;init-themes.el ends here
