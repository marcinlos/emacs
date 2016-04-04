;;; Projectile configuration

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  ;; Shorten mode line indicator
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name)))))


(provide 'mlos-projectile)
