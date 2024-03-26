;;;init-tools.el --- Load the configuration for some useful tools
;;; Commentray


;;;Code:
;;for ivy package
(use-package counsel
  :ensure t)

(use-package ivy            
  :ensure t
  :init
  (ivy-mode 1)            ;open ivy mode
  ;(counsel-mode 1)
  :config
  ;(setq ivy-use-virtual-buffers t);show some not open buffer, like recent files and bookmark
  (setq ivy-count-format "(%d/%d) ");the format for numbers in minibuffer. "" for no number,"%d" for only the total choice number
  (setq ivy-extra-directories nil);when find files, no extra file like ./ ../
  (setq ivy-wrap t)         ;make sure in the minibuffer can cycle between the first and last line
  (setq confirm-nonexistent-file-or-buffer t) ;when make a non-exist file or buffer, need an extra RET
  :bind
  (("C-s" . 'swiper)))

;; for projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

;; for company
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
    (setq company-minimum-prefix-length 1) ;complete when only 1 char
    (setq company-idle-delay 0)            ;complete immediately
    (setq company-selection-wrap-around t) ;cycle between the head and the tail
    (setq company-show-numbers t)          ;show number in completion
    (setq company-tooltip-align-annotations t);add annotations behind some completions
    )
(provide 'init-tools)
