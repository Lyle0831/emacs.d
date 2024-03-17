;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
	     
(defconst *spell-check-support-enabled* t)
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-win* (eq system-type 'windows-nt))
(defconst *is-a-linux* (eq system-type 'gnu/linux))
(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;;basic customize
(setq confirm-kill-emacs #'yes-or-no-p)          ;ask yes or no before close the emacs
(electric-pair-mode t)                           ;finish the brackets automatically
(add-hook 'prog-mode-hook #'show-paren-mode)     ;highlight another bracket when in program mode
(add-hook 'prog-mode-hook #'hs-minor-mode)       ;Collapse the code block
(column-number-mode t)                           ;show line number
(global-display-line-numbers-mode 1)             ;show line number on windows
(global-auto-revert-mode t)                      ;when the file was modified, revert it automatically
(delete-selection-mode t)                        ;replace the region when type something
(setq inhibit-startup-message t)                 ;close the welcome message
(setq make-backup-files nil)                     ;close backup files automatically
(tool-bar-mode -1)                               ;close the tool bar
(when (display-graphic-p) (toggle-scroll-bar -1));close toogle scroll bar in graphic interface
(savehist-mode 1)                                ;open buffer history save
;(setq display-line-numbers-type 'relative)      ;show relative line number
(add-to-list 'default-frame-alist '(width . 103));default frame width
(add-to-list 'default-frame-alist '(height . 54));default frame height
(setq word-wrap-by-category t)                   ;deal with the line change problem
(global-visual-line-mode 1)                      ;1 for on, 0 for off

;; some keyboard shortcut setting
(global-set-key (kbd "RET") 'newline-and-indent) ;set RET as newline and indent
(global-set-key (kbd "M-w") 'kill-region)        ;set M-w as cut
(global-set-key (kbd "C-w") 'kill-ring-save)     ;set C-w as copy
(global-set-key (kbd "C-a") 'back-to-indentation);set C-a as go to the indentation
(global-set-key (kbd "M-m") 'move-beginning-of-line)   ;set M-m as go to the true beginning of the line
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region) ;set C-c ' as comment or uncomment for the region

(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines"
  (interactive)
  (previous-line 10))
(global-set-key (kbd "M-n") 'next-ten-lines)
(global-set-key (kbd "M-p") 'previous-ten-lines)
;(global-set-key (kbd "C-j") nil)                 ;unbinding C-j
;(global-set-key (kbd "C-j C-k") 'kill-whole-line);cut the whole line

(require 'init-package)
(require 'init-themes)
(require 'init-tools)
(require 'init-org)

(when *is-a-win*
  (require 'init-win))

(require 'hello)
(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


