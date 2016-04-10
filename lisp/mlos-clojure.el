;;; CIDER configuration

(defun mlos/setup-clojure-modes ()
  (subword-mode)
  (paredit-mode))

;; Major mode for editing clojure code
(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook #'mlos/setup-clojure-modes))

;; SLIME-like minor mode for clojure
(use-package cider
  :ensure t
  :defer t
  :config
  (defun mlos/setup-cider-modes ()
    (mlos/setup-clojure-modes)
    (eldoc-mode))
  (add-hook 'cider-mode-hook #'mlos/setup-cider-modes)
  (add-hook 'cider-repl-mode-hook #'mlos/setup-cider-modes))

(provide 'mlos-clojure)
