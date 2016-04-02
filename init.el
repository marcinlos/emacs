;;; Main Emacs config file

;; Initialize package system
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initialize packages now, not after executing init.el
(setq package-enable-at-startup nil)
(package-initialize)

;; Set up load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Install and configure use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)


;; Personal data (name, email)
(require 'personal-info)

;; General config
(require 'mlos-gui)
(require 'mlos-editing)
(require 'mlos-backup)
(require 'mlos-ido)
(require 'mlos-spelling)
(require 'mlos-misc)
(require 'mlos-magit)
(require 'mlos-company)
(require 'mlos-flycheck)

;; Language-specific config
(require 'mlos-org)
(require 'mlos-latex)
(require 'mlos-haskell)

