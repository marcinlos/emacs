;;; Company-mode completion configuration


(use-package company
  :ensure t
  :diminish company-mode
  :config
  ;; start completion at 2 characters
  (setq company-minimum-prefix-length 2)
  ;; short delay before popup appears
  (setq company-idle-delay 0.1)
  ;; don't convert case of dynamic abbreviations
  (setq company-dabbrev-downcase nil)
  ;; show quick access candidate numbers
  (setq company-show-numbers t)
  ;; enable company mode in all buffers
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1))

(provide 'mlos-company)
