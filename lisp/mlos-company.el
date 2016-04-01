;;; Company-mode completion configuration


(use-package company
  :ensure t
  :diminish ""
  :config
  ; start completion at 2 characters
  (setq company-minimum-prefix-length 2)
  ; enable company mode in all buffers
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1))

(provide 'mlos-company)
