;;; Scheme configuration

(use-package scheme
  :defer t
  :init
  (defun mlos/setup-scheme-modes ()
    (paredit-mode)
    (eldoc-mode)
    (flycheck-mode))

  (add-hook 'scheme-mode-hook #'mlos/setup-scheme-modes))

(use-package geiser
  :ensure t
  :defer t)

(use-package geiser-autodoc
  :diminish geiser-autodoc-mode
  :defer t)


(provide 'mlos-scheme)
