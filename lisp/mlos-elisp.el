;;; Configuration for Emacs Lisp editing

;; Prepare Emacs Lisp modes
(let ((elisp-modes '(emacs-lisp-mode-hook
                     lisp-interaction-mode-hook
                     ielm-mode-hook)))

  ;; symbol navigation as in SLIME
  (use-package elisp-slime-nav
    :ensure t
    :diminish elisp-slime-nav-mode)

  (defun mlos/setup-elisp-modes ()
    "Enable tools for editing Emacs Lisp code"
    (eldoc-mode)
    (paredit-mode)
    (elisp-slime-nav-mode))

  (dolist (m elisp-modes)
    (add-hook m #'mlos/setup-elisp-modes)))


(provide 'mlos-elisp)
