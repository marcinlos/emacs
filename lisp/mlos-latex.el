;;; Configuration for Latex

(use-package tex
  :ensure auctex
  :defer t
  :config
  (setq TeX-auto-save t
        TeX-parse-self t)
  ;; for multi-project files - prompt for master file
  (setq-default TeX-master nil)

  (defun mlos/latex-mode-hook ()
    (turn-on-reftex)
    ;; one sentence per line
    (visual-line-mode)
    ;; spell checker
    (require 'flyspell)
    (flyspell-mode t))

  (add-hook 'LaTeX-mode-hook #'mlos/latex-mode-hook))

(use-package bibtex
  :defer t
  :init
  (defun mlos/bibtex-mode-hook ()
    (visual-line-mode))
  (add-hook 'bibtex-mode-hook #'mlos/bibtex-mode-hook))

;;; Helm support for LaTeX bibliography
(use-package helm-bibtex
  :ensure t
  :defer t)

(provide 'mlos-latex)
