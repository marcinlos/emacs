;;; C-like modes configuration

(defconst mlos/c-mode-hooks
  '(c++-mode-hook c-mode-hook)
  "Hooks for C and C++ modes")

(defun mlos/add-c-hook (hook-function)
  "Adds hook to C and C++ modes, as specified by `mlos/c-mode-hooks'"
  (dolist (h mlos/c-mode-hooks)
    (add-hook h hook-function)))


(use-package irony
  :ensure t
  :defer t
  :diminish irony-mode
  :init
  (mlos/add-c-hook #'irony-mode)
  (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options))

;; Company backend based on irony
(use-package company-irony
  :ensure t
  :defer t)

;; Flycheck irony integration
(use-package flycheck-irony
  :ensure t
  :defer t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Eldoc support based on irony
(use-package irony-eldoc
  :ensure t
  :defer t)


(use-package company-c-headers
  :ensure t
  :defer t
  :config
  (let ((header-paths '("/usr/include/c++/5/")))
    (dolist (path header-paths)
      (push path company-c-headers-path-system))))


(use-package cc-mode
  :defer t

  :init
  (add-hook 'c++-mode-hook
            (lambda ()
              (mlos/add-local-company-backend '(company-c-headers company-irony))))
  :config
  (defun mlos/setup-c-modes ()
    ;; on-the-fly checker
    (flycheck-mode)
    (irony-eldoc))

  (mlos/add-c-hook #'mlos/setup-c-modes)

  ;; set code style, defaults are ugly
  (setq c-default-style "linux"
        c-basic-offset 4))


(provide 'mlos-cc)
