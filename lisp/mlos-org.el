;;; Org mode configuration

(use-package org
  :ensure t
  :init
  (mlos/describe-keys "C-c o" "org mode")

  :bind (("C-c o l" . org-store-link)
         ("C-c o c" . org-capture)
         ("C-c o a" . org-agenda)
         ("C-c o b" . org-iswitchb))

  :config
  (setq org-completion-use-ido t)
  (setq org-outline-path-complete-in-steps nil)

  ;; disable electric-indent as it causes problems with org
  (add-hook 'org-mode-hook
            (lambda () (electric-indent-mode -1))))


(provide 'mlos-org)
