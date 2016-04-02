;;; Flyspell configuration


(use-package flyspell
  :diminish flyspell-mode
  :diminish flyspell-prog-mode

  :config
  ;; Enable ordinary Flyspell for text modes
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;; Enable comment-and-string-only mode for program modes
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))


(provide 'mlos-spelling)
