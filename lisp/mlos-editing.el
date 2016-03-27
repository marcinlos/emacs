;;; Text editing utilities (bindings etc.)


;; Indentation with spaces
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Indent automatically on return
(electric-indent-mode)

;; Tab indents if necessary, otherwise completes
(setq tab-always-indent 'complete)

;; Align by regex
(global-set-key (kbd "C-x \\") 'align-regexp)

;; (Un)comment with C-;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; Better expanding
(global-set-key (kbd "M-/") 'hippie-expand)

;; Override marked text
(delete-selection-mode)


(provide 'mlos-editing)
