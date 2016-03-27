;;; Main Emacs config file

;; Initialize package system
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initialize packages now, not after executing init.el
(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'personal-info)

;; General config
(require 'mlos-gui)
(require 'mlos-editing)
(require 'mlos-backup)
(require 'mlos-ido)
(require 'mlos-misc)

;; Language-specific config
(require 'mlos-org)
(require 'mlos-auctex)
(require 'mlos-haskell)
