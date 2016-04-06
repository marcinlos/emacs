;;; Haskell mode configuration


;; Make sure emacs can find the haskell auxiliary executables
(let ((mlos/cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat mlos/cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path mlos/cabal-path))

(use-package flycheck-haskell
  :ensure t)

(use-package haskell-mode
  :ensure t
  :config

  (custom-set-variables
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-log t))

  ;; Use cabal-repl with ghci-ng
  (custom-set-variables '(haskell-process-type 'cabal-repl))
  (setq haskell-process-args-cabal-repl
        '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))

  (defun mlos/haskell-mode-hook ()
    ;; enable interactive mode
    (interactive-haskell-mode)
    ;; enable enhanced documentation
    (turn-on-haskell-doc)
    ;; insert module template into a newly created module file
    (haskell-auto-insert-module-template)
    ;; flycheck support
    (flycheck-mode)
    (flycheck-haskell-setup)
    ;; enable moving by declaration
    (haskell-decl-scan-mode)

    ;; enable code completion
    (company-mode)
    ;; sub-word movement
    (subword-mode)
    ;; diminish minor modes
    (diminish 'haskell-doc-mode)
    (diminish 'interactive-haskell-mode))

  (add-hook 'haskell-mode-hook #'mlos/haskell-mode-hook)

  ;; Key bindings

  ;; haskell bindings
  (with-eval-after-load 'haskell-mode
    (bind-keys :map haskell-mode-map
               ("C-c C-l" . haskell-process-load-file)
               ("C-c C-z" . haskell-interactive-switch)
               ("C-c C-t" . haskell-process-do-type)
               ("C-c C-i" . haskell-process-do-info)
               ("C-c c"   . haskell-process-cabal)
               ("C-c C-c" . haskell-process-cabal-build))
    (bind-key "M-/" #'company-complete haskell-mode-map))

  ;; haskell interactive mode bindings
  (with-eval-after-load 'interactive-haskell-mode
    (bind-keys :map interactive-haskell-mode-map
               ("C-c C-t" . haskell-mode-show-type-at)
               ("M-."     . haskell-mode-goto-loc)))

  ;; cabal file bindings
  (with-eval-after-load 'haskell-cabal
    (bind-keys :map haskell-cabal-mode-map
               ("C-c C-z" . haskell-interactive-switch)
               ("C-c C-k" . haskell-interactive-mode-clear)
               ("C-c c"   . haskell-process-cabal)
               ("C-c C-c" . haskell-process-cabal-build))))

;; hi2 intendation
(use-package hi2
  :ensure t
  :diminish 'hi2-mode
  :config
  (add-hook 'haskell-mode-hook #'turn-on-hi2)
  ;; disable visual indicators
  (setq hi2-show-indentations nil))

;; Backend for company
(use-package company-ghci
  :ensure t
  :config
  (push 'company-ghci company-backends)
  (add-hook 'haskell-mode-hook #'company-mode))


(provide 'mlos-haskell)
