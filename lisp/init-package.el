;;; init-package.el --- Load the configuration for packages
;;; Commentary:

;; packages from melpa
;; use use-package to manager

;;;Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
;                         ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))

(package-initialize)
(eval-when-compile
  (require 'use-package))
(package-refresh-contents)
(provide 'init-package)
;;; init-package.el ends here
