;;; Configuration for Emacs Lisp editing

;; Prepare Emacs Lisp modes
(let ((elisp-modes '(emacs-lisp-mode-hook
                     lisp-interaction-mode-hook
                     ielm-mode-hook)))

  (use-package eval-sexp-fu
    :ensure t
    :commands eval-sexp-fu-flash-mode
    :config
    (set-face-bold 'eval-sexp-fu-flash nil)
    (set-face-bold 'eval-sexp-fu-flash-error nil))

  ;; symbol navigation as in SLIME
  (use-package elisp-slime-nav
    :ensure t
    :diminish elisp-slime-nav-mode
    :defer t)

  (defun mlos/setup-elisp-modes ()
    "Enable tools for editing Emacs Lisp code"
    (eldoc-mode)
    (paredit-mode)
    (elisp-slime-nav-mode)
    (eval-sexp-fu-flash-mode))

  (dolist (m elisp-modes)
    (add-hook m #'mlos/setup-elisp-modes)))


(provide 'mlos-elisp)
