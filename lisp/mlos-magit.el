;;; Magit configuration

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; Move between versions of a file
(use-package git-timemachine
  :ensure t)

(provide 'mlos-magit)
