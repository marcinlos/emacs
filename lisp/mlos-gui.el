;;; GUI settings


(load-theme 'monokai t)

;; Highlight parenthesis pairs
(use-package paren
  :config
  (show-paren-mode)
  (setq show-paren-delay 0.08))

;; disable blinking cursor
(blink-cursor-mode -1)

;; no useless GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; No splash screen
(setq inhibit-startup-message t)

;; Display line numbers on the left
(use-package linum
  :config
  ;; only needed for programming
  (add-hook 'prog-mode-hook 'linum-mode))

;; Display column number in the mode line
(column-number-mode)

;; Highlight current line
(global-hl-line-mode)

;; Mark trailing whitespace in programming modes
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; Font - Consolas
(set-face-attribute 'default nil :family "Consolas" :height 100)


(provide 'mlos-gui)
