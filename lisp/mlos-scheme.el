;;; Scheme configuration

(defun mlos/setup-scheme-modes ()
    (paredit-mode)
    (eldoc-mode)
    (flycheck-mode))

(use-package scheme
  :defer t
  :init
  (add-hook 'scheme-mode-hook #'mlos/setup-scheme-modes))

(use-package quack
  :ensure t
  :defer t)

(use-package geiser
  :ensure t
  :defer t
  :config
  (setq geiser-default-implementation 'racket)
  (add-hook 'geiser-repl-mode-hook #'mlos/setup-scheme-modes)
  :bind (("C-c C-l" . run-geiser)))

(use-package geiser-autodoc
  :diminish geiser-autodoc-mode
  :defer t)


(provide 'mlos-scheme)
