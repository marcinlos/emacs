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
            (lambda () (electric-indent-local-mode -1))))

(use-package org-ref
  :ensure t
  :defer t
  :config
  (require 'mlos-bibliography)
  (require 'org-ref-pdf)
  (require 'org-ref-url-utils)
  (setq org-ref-notes-directory mlos/bibliography-notes-dir
        org-ref-default-bibliography (list mlos/bibliography-file)
        org-ref-bibliography-notes (mlos/in-bib-dir "notes.org")
        org-ref-pdf-directory mlos/bibliography-pdfs-dir))


(provide 'mlos-org)
