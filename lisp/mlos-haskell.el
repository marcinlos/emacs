;;; Haskell mode configuration


;; Make sure emacs can find the haskell auxiliary executables
(let ((mlos/cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat mlos/cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path mlos/cabal-path))

(use-package haskell-mode
  :ensure t
  :config

  (custom-set-variables
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-log t))

  ; Use cabal-repl with ghci-ng
  (custom-set-variables '(haskell-process-type 'cabal-repl))
  (setq haskell-process-args-cabal-repl
        '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))

  (defun mlos/haskell-mode-hook ()
    ; insert module template into a newly created module file
    (haskell-auto-insert-module-template)
    ; flycheck support
    (flycheck-mode)
    (flycheck-haskell-setup)
    ; enable moving by declaration
    (haskell-decl-scan-mode)

    ; enable code completion
    (company-mode))

  (add-hook 'haskell-mode-hook 'mlos/haskell-mode-hook)

  ; Key bindings

  ; haskell bindings
  (with-eval-after-load 'haskell-mode
    (bind-key "M-/" 'company-complete haskell-mode-map)
    (bind-key "C-c C-l" 'haskell-process-load-or-reload haskell-mode-map)
    (bind-key "C-c C-z" 'haskell-interactive-switch haskell-mode-map)
    (bind-key "C-c C-n C-t" 'haskell-process-do-type haskell-mode-map)
    (bind-key "C-c C-n C-i" 'haskell-process-do-info haskell-mode-map)
    (bind-key "C-c C-n C-c" 'haskell-process-cabal-buil haskell-mode-map)
    (bind-key "C-c C-n c" 'haskell-process-cabal haskell-mode-map))
  ; cabal file bindings
  (with-eval-after-load 'haskell-cabal
    (bind-key "C-c C-z" 'haskell-interactive-switch haskell-cabal-mode-map)
    (bind-key "C-c C-k" 'haskell-interactive-mode-clear haskell-cabal-mode-map)
    (bind-key "C-c C-c" 'haskell-process-cabal-build haskell-cabal-mode-map)
    (bind-key "C-c c" 'haskell-process-cabal haskell-cabal-mode-map)))

;; hi2 intendation
(use-package hi2
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'turn-on-hi2)
  ; disable visual indicators
  (setq hi2-show-indentations nil))

;; Backend for company
(use-package company-ghci
  :ensure t
  :config
  (push 'company-ghci company-backends)
  (add-hook 'haskell-mode-hook 'company-mode))


(provide 'mlos-haskell)
