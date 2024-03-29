;;; init-themes.el --- Load the configuration for themes
;;; Commentary:

;; use doom-moonlight theme now

;;;Code:
;;for all-the-icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;;for dashboard
(use-package dashboard
  :init
  (setq org-agenda-files '("~/Nutstore Files/roam-notes/agenda/20240101131142-2024.org"))
  (when *is-a-win*
    (setq org-agenda-files '("e:/Lei/roam-notes/agenda/20240101131142-2024.org")))
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Iven's Emacs!") ;; dashboard title
  (setq dashboard-startup-banner 'official) ;; dashboard picture
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents  . 3)   ;; dashboard items number
			  (projects . 5)
			  (bookmarks . 2)
			  (agenda . 8)))
  (setq dashboard-agenda-sort-strategy '(time-up)); agenda sort, time close first
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-center-content t)
  (dashboard-open))

;;for doom themes
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
