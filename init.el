;;; Main Emacs config file

(add-to-list 'load-path user-emacs-directory)

(require 'personal-info)

;; Initialize package system
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Prevent loading the packages twice
(setq package-enable-at-startup nil)
(package-initialize)

(require 'mlos-ido-config)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Parens
(require 'paren)
(show-paren-mode)
(setq show-paren-delay 0.08)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match "darkseagreen2")

;; No fancy GUI
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Move between windows with S-(arrow)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Better naming for buffers with same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)

;; Scrolling
(setq-default scroll-conservatively 100)
(setq-default scroll-margin 3)
(setq-default scroll-preserve-screen-position t)

;; Display line numbers on the left
(global-linum-mode)
(column-number-mode)

;; Highlight current line
(global-hl-line-mode)
(set-face-background 'hl-line "#e0f8ff")

;; Indent automatically on return
;(global-set-key (kbd "RET") (key-binding (kbd "C-j")))
(electric-indent-mode)

;; Switch windows with M-o
(global-set-key (kbd "M-o") 'other-window)

;; Use IBuffer instead of built-in buffer manager
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (Un)comment with C-;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; Better expanding
(global-set-key (kbd "M-/") 'hippie-expand)

;; Override marked text
(delete-selection-mode)

;; Answer prompt with one letter
(fset 'yes-or-no-p 'y-or-n-p)

;; Display partially entered commands faster
(setq echo-keystrokes 0.1)

;; Mark trailing whitespace in programming modes
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; Backups in separate directory
(push '("." . "~/.emacs-backups") backup-directory-alist)

;; No splash screen
(setq inhibit-startup-message t)

;; Font - Consolas
(set-face-attribute 'default nil
                    :family "Consolas")
