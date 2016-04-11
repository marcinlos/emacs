;;; Main Emacs config file

;; Less frequent garbage collection (optimization)
(setq gc-cons-threshold 100000000)

;; Initialize package system
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initialize packages now, not after executing init.el
(setq package-enable-at-startup nil)
(package-initialize)

;; Set up load path
(defconst mlos/load-path (expand-file-name "lisp" user-emacs-directory)
  "Directory with custom configuration files")

(add-to-list 'load-path mlos/load-path)

;; Install and configure use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)


;; Personal data (name, email)
(require 'personal-info)

;; General config
(require 'mlos-which-key)
(require 'mlos-gui)
(require 'mlos-window)
(require 'mlos-movement)
(require 'mlos-editing)
(require 'mlos-grep)
(require 'mlos-parens)
(require 'mlos-backup)
(require 'mlos-ido)
(require 'mlos-spelling)
(require 'mlos-misc)
(require 'mlos-magit)
(require 'mlos-company)
(require 'mlos-flycheck)
(require 'mlos-projectile)

;; Language-specific config
(require 'mlos-elisp)
(require 'mlos-org)
(require 'mlos-latex)
(require 'mlos-haskell)
(require 'mlos-slime)
(require 'mlos-clojure)

