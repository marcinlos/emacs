;;; GUI settings

;; Theme
(use-package monokai
  :ensure monokai-theme
  :init (load-theme 'monokai t))

(use-package zenburn
  :ensure zenburn-theme
  :disabled
  :init (load-theme 'zenburn t))

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


(use-package frame
  :config
  ;; unbind frame suspension
  (global-set-key (kbd "C-z") nil)
  (global-set-key (kbd "C-x C-z") nil))

;; No splash screen
(setq inhibit-startup-message t)

;; Short initial message in the scratch buffer
(setq initial-scratch-message ";; Scratch buffer - welcome!\n\n")


;; Display line numbers on the left
(use-package linum
  :config
  ;; only needed for programming
  (add-hook 'prog-mode-hook 'linum-mode))

;; Display column number in the mode line
(column-number-mode)

;; Highlight current line
(global-hl-line-mode)

;; Displays count and position of search matches
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :config
  (global-anzu-mode)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key (kbd "M-R") 'anzu-replace-at-cursor-thing))

;; Mark trailing whitespace in programming modes
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; Font - Consolas
(set-face-attribute 'default nil :family "Consolas" :height 100)


(provide 'mlos-gui)
