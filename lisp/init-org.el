;;; init-org.el --- Load the full configuration for org mode
;;; Commentary:

;;;Code:
;;some shortcut
;(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
;(global-set-key (kbd "C-c c") #'org-capture)

(setq org-agenda-files '("~/Nutstore Files/roam-notes/agenda"))
(setq org-deadline-warning-days 1)        ;show deadline things before 1 day
(setq org-habit-show-habits t)            ;show habits in agenda
(setq org-startup-folded t)               ;folded all headlines when open an org file
(when *is-a-win*
  (setq org-agenda-files '("e:/Lei/roam-notes/agenda")))

(use-package org-roam
  :ensure t
  :unless (and *is-a-linux* (eq system-type 'DLOFR7FAT0DUIYL))
  :init
  (setq org-roam-directory (file-truename "~/Nutstore Files/roam-notes/"))
  (when *is-a-win*
    (setq org-roam-directory (file-truename "E:/Lei/roam-notes/")))
  :custom
  (org-roam-dailies-directory "daily/")
  (org-roam-database-connector 'sqlite-builtin)
  :bind
  ("C-c n f" . org-roam-node-find)
  ("C-c n i" . org-roam-node-insert)
  ("C-c n c" . org-roam-capture)
  ("C-c n j" . org-roam-dailies-capture-today)
  ;("C-c n u" . org-roam-ui-mode)
  ;("C-c n l" . org-roam-buffer-toggle)
  ;("C-c n g" . org-roam-graph)
  ;:bind-keymap
  ;("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (completion-at-point)                     ;completion title when in link
  (org-roam-db-autosync-mode))              ;auto sync when save a roam file

(provide 'init-org)

