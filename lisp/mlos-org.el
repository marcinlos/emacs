;;; Org mode configuration

;; Org mode bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil)

(add-hook 'org-mode-hook
          (lambda () (electric-indent-mode -1)))


(provide 'mlos-org)
