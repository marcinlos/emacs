;;; GUI settings


(load-theme 'monokai t)

;; Highlight parenthesis pairs
(require 'paren)
(show-paren-mode)
(setq show-paren-delay 0.08)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; No useless GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; No splash screen
(setq inhibit-startup-message t)

;; Display line numbers on the left
(global-linum-mode)
(column-number-mode)

;; Highlight current line
(global-hl-line-mode)

;; Mark trailing whitespace in programming modes
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; Font - Consolas
(set-face-attribute 'default nil :family "Consolas" :height 100)


(provide 'mlos-gui)
