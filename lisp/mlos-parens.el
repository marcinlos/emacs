;;; Global parenthesis configuration

(use-package paredit
  :ensure t
  :diminish "")

;; Highlight brackets according to their depth
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


(provide 'mlos-parens)
