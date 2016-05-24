;;; GUI settings

;; Theme
(use-package monokai
  :ensure monokai-theme
  :init
  (setq monokai-height-plus-1 1.0
        monokai-height-plus-2 1.05
        monokai-height-plus-3 1.1
        monokai-height-plus-4 1.15)
 (load-theme 'monokai t))

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
  (unbind-key "C-z")
  (unbind-key "C-x C-z"))

;; No splash screen
(setq inhibit-startup-message t)

;; Short initial message in the scratch buffer
(setq initial-scratch-message ";; Scratch buffer - welcome!\n\n")


;; Display line numbers on the left
(use-package linum
  :config
  ;; only needed for programming
  (add-hook 'prog-mode-hook #'linum-mode))

;; Display column number in the mode line
(column-number-mode)

;; Highlight current line
(global-hl-line-mode)

;; Mode line modification
(use-package smart-mode-line
  :ensure t
  :config
  ;; theme using colors from main GUI theme
  (setq sml/theme 'respectful)
  ;; avoid confirmation prompt
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; Displays count and position of search matches
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :demand
  :config
  (global-anzu-mode)

  :bind (([remap query-replace-regexp] . anzu-query-replace-regexp)
         ([remap query-replace] . anzu-query-replace)
         ("M-R" . anzu-replace-at-cursor-thing)))


;; Mark trailing whitespace in programming modes
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; Font - Consolas
(set-face-attribute 'default nil :family "Consolas" :height 100)


(provide 'mlos-gui)
