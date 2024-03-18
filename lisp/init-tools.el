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
  ;(setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-wrap t)         ;make sure in the minibuffer can cycle between the first and last line
  (setq confirm-nonexistent-file-or-buffer t) ;when make a non-exist file or buffer, need an extra RET
  :bind
  (("C-s" . 'swiper))
   ;("C-c v" . 'ivy-push-view)
   ;("C-c s" . 'ivy-switch-view)
   ;("C-c V" . 'ivy-pop-view)
   ;("C-x C-@" . 'counsepl-mark-ring);  

   ;("C-x C-SPC" . 'counsel-mark-ring)
   ;:map minibuffer-local-map
   ;("C-r" . counsel-minibuffer-history)))
)
(provide 'init-tools)
