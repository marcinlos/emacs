;;; Movement configuration

;; Move between windows with S-(arrow)
(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

;; Scrolling
(setq-default scroll-conservatively 100
              scroll-margin 3
              scroll-preserve-screen-position t)

;; Scroll by half screen
(use-package view
  :bind (([remap scroll-up-command] . View-scroll-half-page-forward)
         ([remap scroll-down-command] . View-scroll-half-page-backward)))

;; Switch windows with M-o
(global-set-key (kbd "M-o") #'other-window)

;; Sub-word movement
(use-package subword
  :diminish subword-mode
  ;; don't load, just diminish if loaded
  :defer t)

;; Jump to location marked by letter
(use-package avy
  :ensure t
  :bind (("C-'" . avy-goto-char-2)
         ("C-\"" . avy-goto-char-timer)
         ("C-M-'" . avy-pop-mark)))

;; Follow links marked by letter
(use-package ace-link
  :ensure t
  :config
  (ace-link-setup-default))

;; Jump/delete window marked by letter
(use-package ace-window
  :ensure t
  :bind (("M-O" . ace-window))
  :config
  ;; use home row to address windows
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; Go to thing declaration
(use-package imenu-anywhere
  :ensure t
  :bind (("C-c i" . imenu-anywhere)))


(provide 'mlos-movement)
