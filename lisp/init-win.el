;;;init-win.el --- Load the configuration the only on windows
;;; Commentray:


;;;Code:
(add-to-list 'default-frame-alist '(width . 80));default frame width
(add-to-list 'default-frame-alist '(height . 45));default frame height

;;beancount
(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.bean\\'" . beancount-mode))

;;latex
(defun my/latex-hook ()
  (turn-on-cdlatex)
  (turn-on-reftex))

(use-package tex
  :ensure auctex
  ;; :straight auctex ;;if use straight
  :custom
  (TeX-parse-self t) ;analysis tex file automatically
  (TeX-PDF-mode t)
  (TeX-DVI-via-PDFTeX t)
  :config
  (setq-default TeX-master t) ;
  (add-hook 'LaTeX-mode-hook 'my/latex-hook)) ; add hook for LaTeX

(use-package cdlatex
  :ensure t
  :after tex ; make sure cdlatex is loaded after auctex 
  ;; :straight (:host github :repo "cdominik/cdlatex" ) ;; if use straight
  )


(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

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

(setq org-directory "E:/Lei/roam-notes")
;(setq prettify-symbols-unprettify-at-point t) ;;自动展开,没有用
(setq temporary-file-directory "d:/.emacs_temp")

(pdf-tools-install)
;(pdf-loader-install) ;打开pdf文件时再加载
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)));取消显示行号
;;开启使用pdf-tools
(require 'pdf-annot)
(define-key pdf-annot-minor-mode-map (kbd "C-a a")
'pdf-annot-add-highlight-markup-annotation);;高亮
(define-key pdf-annot-minor-mode-map (kbd "C-a d") 'pdf-annot-delete);;删除
;;定义看pdf时的快捷键


(use-package org-roam-ui
  :ensure t
  :after org-roam
  :custom
  (org-roam-ui-sync-theme);;同步Emacs主题
  (org-roam-ui-follow t);;笔记节点跟随
  (org-roam-ui-update-on-save t))

(use-package org-noter
  :ensure t
  :custom
  (org-noter-notes-search-path '("e:/Lei/roam-notes/org-noter/"));;默认笔记路径
  (org-noter-auto-save-last-location t);;自动保存上次阅读位置
  (org-noter-highlight-selected-text t);;插入笔记后自动高亮
  (org-noter-max-short-selected-text-length 20);;长短标题区分设为20
  :bind
  (("C-c n n" . org-noter));;与org-roam配合
  )

;设置zotero笔记
(setq zot_bib '("e:/Lei/research-papers/Kilonova.bib")
      zot_pdf "e:/Lei/research-papers"
      org_refs "e:/Lei/roam-notes/research/papers/")
(use-package helm-bibtex
  :ensure t
  :custom
  (bibtex-completion-notes-path org_refs)
  (bibtex-completion-bibliography zot_bib)
  (bibtex-completion-library-path zot_pdf))
(use-package org-roam-bibtex
  :ensure t
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :bind (("C-c n k" . orb-insert-link)
	 ("C-c n a" . orb-note-action))
  :custom
  (org-insert-interface 'helm-bibtex)
  (org-insert-link-description 'citekey)
  (orb-preformat-keywords '("citekey" "title" "url" "author-or-editor" "keywords" "file"))
  (orb-process-file-keyword t)
  (orb-attached-file-extensions '("pdf")))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsepl-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

;;https://github.com/abo-abo/swiper
;;以上为counsel和ivy的导入与设置

 (use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)))  ;; 显示多少个最近书签
			  ;(projects . 10))) ;; 显示多少个最近项目
  (dashboard-setup-startup-hook))

;;https://github.com/emacs-dashboard/emacs-dashboard
;;dashboard的设置

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉

;;使用插件company，自动补全

(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;;使用插件yasnippet,代码片段模板

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))

;;使用插件flycheck，语法检查

(use-package lsp-mode
  ;:ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 500)
  :hook
  (lsp-mode . lsp-enable-which-key-integration) ; which-key integration
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
  (setq lsp-headerline-breadcrumb-enable t)
  :bind
  ("C-c m s" . lsp-ivy-workspace-symbol)) ;; 可快速搜索工作区内的符号（类名、函数名、变量名等）

;; 使用插件lsp,代码分析

(use-package lsp-ui
  :ensure t
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'top))
;;使用lsp-ui，在鼠标放在一个函数上时显示其相关信息

(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

;;使用插件projectile，进行项目管理

(use-package magit
  :ensure t)

;;使用插件magit，用git工具进行版本管理

(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
  );:config
  ;; for debug
  ;(require 'dap-python))

;;python mode

(use-package lsp-pyright
  :ensure t
  :config
  :hook
  (python-mode . (lambda ()
		  (require 'lsp-pyright)
		  (lsp-deferred))))

;用于代码分析的python配置

;(setq org-agenda-include-diary t);;将日历与diary链接起来

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(org-agenda-files '("e:/Lei/roam-notes/agenda"))
 '(org-deadline-warning-days 1)
 '(org-habit-show-habits t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-startup-folded t)
 '(org-use-sub-superscripts '{})
 '(package-selected-packages
   '(lsp-mode yasnippet-snippets yasnippet auctex djvu nov org-noter org-roam pdf-tools zenburn-theme swiper-helm counsel ivy))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight regular :height 143 :width normal)))))
(provide 'init-win)
