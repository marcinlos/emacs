;;; Company-mode completion configuration


(use-package company
  :ensure t
  :demand
  :diminish company-mode

  :config
  ;; start completion at 2 characters
  (setq company-minimum-prefix-length 2
        ;; short delay before popup appears
        company-idle-delay 0.1
        ;; don't convert case of dynamic abbreviations
        company-dabbrev-downcase nil
        ;; show quick access candidate numbers
        company-show-numbers t
        ;; offer identifier completion in comments and strings
        company-dabbrev-code-everywhere t
        ;; ignore case when collecting identifiers
        company-dabbrev-code-ignore-case t)

  (setq-default company-backends '((company-capf
                                    company-dabbrev-code
                                    company-keywords
                                    company-yasnippet)
                                   company-dabbrev))

  ;; enable company mode in all buffers
  (global-company-mode)

  (mlos/describe-keys "C-c c" "completion")

  (defun mlos/add-local-company-backend (backend)
    "Makes `company-backends' a local variable and adds specified backend to it"
    (set (make-local-variable 'company-backends)
         (append (list backend) company-backends)))

  :bind (("C-c c i" . company-dabbrev-code)
         ("C-c c y" . company-yasnippet)
         ("C-c c f" . company-files)
         ("C-c c s" . company-ispell)))

(use-package company-quickhelp
  :ensure t
  :demand

  :config
  (company-quickhelp-mode 1)
  (unbind-key "M-h" company-quickhelp-mode-map)

  (with-eval-after-load 'company
    (bind-key "M-h" #'company-quickhelp-manual-begin company-active-map)))


(provide 'mlos-company)
