;;; Org mode configuration

(use-package org
  :ensure t
  ;; global bindings
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb))

  :config
  (setq org-completion-use-ido t)
  (setq org-outline-path-complete-in-steps nil)

  ;; disable electric-indent as it causes problems with org
  (add-hook 'org-mode-hook
            (lambda () (electric-indent-mode -1))))


(provide 'mlos-org)
