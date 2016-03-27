;;; haskell mode configuration

;; Make sure emacs can find the haskell auxiliary executables
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(require 'haskell)
(require 'haskell-process)
(require 'haskell-interactive-mode)

;; Configure REPL
(custom-set-variables '(haskell-process-type 'cabal-repl))
(setq haskell-process-args-cabal-repl
      '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))

;; hi2 intendation
(require 'hi2)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(setq hi2-show-indentations nil)

;; Flycheck support
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-haskell-setup)

;; Enable module template insertion
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; Interactive mode
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

;; Company mode for code completion
(require 'company)
(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(company-quickhelp-mode 1)


(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "M-/") 'company-complete)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))

(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))


(provide 'mlos-haskell)
