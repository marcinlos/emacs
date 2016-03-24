;;; Main Emacs config file

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'personal-info)

;; Initialize package system
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Prevent loading the packages twice
(setq package-enable-at-startup nil)
(package-initialize)

(require 'mlos-ido-config)

;; Set theme early
(load-theme 'monokai t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Parens
(require 'paren)
(show-paren-mode)
(setq show-paren-delay 0.08)

;; No fancy GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; Indent automatically on return
(electric-indent-mode)
(add-hook 'org-mode-hook
          (lambda () (electric-indent-mode -1)))

;; Switch windows with M-o
(global-set-key (kbd "M-o") 'other-window)

;; Use IBuffer instead of built-in buffer manager
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (Un)comment with C-;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; Better expanding
(global-set-key (kbd "M-/") 'hippie-expand)

;; Org mode bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil)


;; Override marked text
(delete-selection-mode)

;; Default column width - 80
(setq-default fill-column 80)

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
(set-face-attribute 'default nil :family "Consolas" :height 100)
