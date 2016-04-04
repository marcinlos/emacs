;;; Configuration for Emacs Lisp editing

;; Prepare Emacs Lisp modes
(let ((modes '(emacs-lisp-mode-hook
               lisp-interaction-mode-hook
               ielm-mode-hook)))
  (defun mlos/setup-elisp-modes ()
    ;; enable eldoc (function signature in mini buffer)
    (eldoc-mode)
    (paredit-mode))
  (dolist (m modes)
    (add-hook m #'mlos/setup-elisp-modes)))


(provide 'mlos-elisp)
