;;; SLIME configuration

(use-package slime
  :ensure t
  :commands slime
  :config

  ;; company backend using SLIME
  (use-package slime-company
    :ensure t
    :config
    ;; use fuzzy matching
    (setq slime-company-completion 'fuzzy))

  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl"))))
  ;; kitchen sink of SLIME extensions
  (slime-setup '(slime-fancy slime-company))

  (defun mlos/setup-common-lisp-modes ()
    "Enable tools for editing Common Lisp code"
    (eldoc-mode)
    (paredit-mode))

  (add-hook 'slime-mode-hook #'mlos/setup-common-lisp-modes)
  (add-hook 'slime-repl-mode-hook #'mlos/setup-common-lisp-modes))


(provide 'mlos-slime)
