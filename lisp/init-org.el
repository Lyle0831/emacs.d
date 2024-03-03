;;; init-org.el --- Load the full configuration for org mode
;;; Commentary:

;;;Code:
;;some shortcut
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-default-notes-file "E:/Lei/roam-notes/agenda/inbox.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n  %a")
	("i" "Idea" entry (file+headline org-default-notes-file "Idea")
	"* %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree org-default-notes-file)
         "* %?\nEntered on %U\n  %i\n ")))


(use-package org
    :defer t ;; 
    :custom
    (org-highlight-latex-and-related '(native latex entities)) ;; LaTeX highlight
    (org-pretty-entities t) ;; LaTeX Code prettify
   ;(org-pretty-entities-include-sub-superscripts nil) ;; show LaTeX subscript 
    (org-format-latex-options
     '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))) ;; make the preview picture bigger
    :config
    (add-hook 'org-mode-hook #'org-cdlatex-mode) ;; open cdlatex
    )

;;open python mode in org
(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (python . t)))

(provide 'init-org)
