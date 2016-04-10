;;; Search configuration

;; Highlight matching part of text
(setq grep-highlight-matches t)

;; Automatically scroll output when new results are reported
(setq grep-scroll-output t)

;; Use Ag if possible
(when (executable-find "ag")
  (use-package ag
    :defer t
    :ensure t)
  ;; writable results
  (use-package wgrep-ag
    :ensure t
    :defer t
    :config
    (setq ag-highlight-search t)))

(provide 'mlos-grep)
