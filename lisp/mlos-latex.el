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

(use-package reftex
  :defer t
  :diminish reftex-mode
  :config
  (require 'mlos-bibliography)
  (setq reftex-default-bibliography '(mlos/bibilography-file)))

(use-package bibtex
  :defer t
  :init
  (defun mlos/bibtex-mode-hook ()
    (visual-line-mode))
  (add-hook 'bibtex-mode-hook #'mlos/bibtex-mode-hook))

;;; Helm support for LaTeX bibliography
(use-package helm-bibtex
  :ensure t
  :defer t
  :config
  (require 'mlos-bibliography)
  (setq bibtex-completion-bibliography mlos/bibliography-file
        bibtex-completion-library-path mlos/bibliography-pdfs-dir
        bibtex-completion-notes-path mlos/bibliography-notes-dir))

(provide 'mlos-latex)
