;;; Haskell mode configuration


(use-package haskell-mode
  :ensure t
  :commands haskell-mode

  :config

  (custom-set-variables
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-log t))

  ;; Use cabal-repl
  (custom-set-variables '(haskell-process-type 'cabal-repl))

  ;; ... with ghci-ng if possible
  (when (executable-find "ghci-ng")
    (setq haskell-process-args-cabal-repl
          '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng")))

  (defun mlos/haskell-mode-hook ()
    ;; enable interactive mode
    (interactive-haskell-mode)
    ;; enable enhanced documentation
    (haskell-doc-mode)
    ;; insert module template into a newly created module file
    (haskell-auto-insert-module-template)
    ;; enable moving by declaration
    (haskell-decl-scan-mode)

    ;; flycheck support
    (flycheck-mode)
    ;; sub-word movement
    (subword-mode))

  (add-hook 'haskell-mode-hook #'mlos/haskell-mode-hook)

    ;; haskell mode bindings
  :bind (:map haskell-mode-map
              ("C-c c"   . haskell-process-cabal)))


;; Configuration of the interactive mode
(use-package haskell
  :commands interactive-haskell-mode
  :diminish interactive-haskell-mode

  :bind (:map interactive-haskell-mode-map
              ("C-c C-t" . haskell-mode-show-type-at)
              ("M-."     . haskell-mode-goto-loc)))


;; cabal file editing mode
(use-package haskell-cabal
  :bind (:map haskell-cabal-mode-map
              ("C-c C-z" . haskell-interactive-switch)
              ("C-c C-k" . haskell-interactive-mode-clear)
              ("C-c c"   . haskell-process-cabal)
              ("C-c C-c" . haskell-process-cabal-build)))

;; Flycheck checker for haskell
(use-package flycheck-haskell
  :ensure t
  :commands flycheck-haskell-setup
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; like ElDoc, for haskell
(use-package haskell-doc
  :diminish haskell-doc-mode
  :defer t)


;; hi2 intendation
(use-package hi2
  :ensure t
  :commands turn-on-hi2
  :diminish 'hi2-mode
  :init
  (add-hook 'haskell-mode-hook #'turn-on-hi2)
  :config
  ;; disable visual indicators
  (setq hi2-show-indentations nil))

;; Backend for company
(use-package company-ghci
  :ensure t
  :commands company-ghci
  :init
  (defun mlos/haskell-add-ghci-backend ()
    "Add `company-ghci' to the list of company backends"
    (push 'company-ghci company-backends))
  (add-hook 'haskell-mode-hook #'mlos/haskell-add-ghci-backend))


(provide 'mlos-haskell)
