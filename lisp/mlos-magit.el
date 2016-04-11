;;; Magit configuration

(use-package magit
  :ensure t
  :init
  (mlos/describe-keys "C-c v" "git")

  :bind (("C-c v v" . magit-status)
         ("C-c v b" . magit-blame)
         ("C-c v i" . magit-gitignore)))

;; Move between versions of a file
(use-package git-timemachine
  :ensure t
  :bind (("C-c v t" . git-timemachine)))

(provide 'mlos-magit)
