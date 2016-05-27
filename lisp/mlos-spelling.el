;;; Flyspell configuration


(use-package flyspell
  :diminish flyspell-mode
  :diminish flyspell-prog-mode

  :config
  ;; don't pollute the binding space
  (dolist (key '("C-c $" "C-;" "C-,"))
    (unbind-key key flyspell-mode-map))
  ;; Enable ordinary Flyspell for text modes
  (add-hook 'text-mode-hook #'flyspell-mode)
  ;; Enable comment-and-string-only mode for program modes
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))

(use-package flyspell-correct
  :ensure t
  :defer t
  :config
  (setq flyspell-correct-interface 'flyspell-correct-helm)
  :bind (:map flyspell-mode-map
              ("C-c ;" . flyspell-correct-word-generic)))


(provide 'mlos-spelling)
