;;; Flycheck configuration

(use-package flycheck
  :ensure t
  :commands flycheck
  :diminish " ✓ ")

;; Display flycheck messages in a tooltip window
(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-mode
  :init
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode)))

(provide 'mlos-flycheck)
