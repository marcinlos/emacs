;;; Search configuration

;; Highlight matching part of text
(setq grep-highlight-matches t)

;; Automatically scroll output when new results are reported
(setq grep-scroll-output t)

;; Use Ag if possible
(when (executable-find "ag")
  (use-package ag
    :ensure t
    :defer t
    :init
    (mlos/describe-keys "C-c s" "ag")
    :config
    (setq ag-highlight-search t)

    :bind (("C-c s s" . ag)
           ("C-c s f" . ag-files)
           ("C-c s r" . ag-regexp)
           ("C-c s d" . ag-dired-regexp)))

  ;; writable results
  (use-package wgrep-ag
    :ensure t
    :defer t)

  (use-package helm-ag
    :ensure t
    :bind (("C-c s h" . helm-do-ag)
           ("C-c s b" . helm-do-ag-buffers))))

(provide 'mlos-grep)
