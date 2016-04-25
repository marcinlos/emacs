;;; Projectile configuration

(use-package projectile
  :ensure t
  :init
  (mlos/describe-keys "C-c p" "projectile")
  :config
  (projectile-global-mode)
  ;; Shorten mode line indicator
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name)))))


;; helm integration with projectile
(use-package helm-projectile
  :ensure t
  :config
  ;; replace projectile commands with helm
  (helm-projectile-on))


(provide 'mlos-projectile)
