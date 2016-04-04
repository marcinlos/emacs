;;; Configuration for Latex

(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t
        TeX-parse-self t)
  ;; for multi-project files - prompt for master file
  (setq-default TeX-master nil)

  (defun mlos/latex-mode-hook ()
    ;; paragraphs are filled to 80 characters
    (turn-on-auto-fill)
    (set-fill-column 80)
    ;; spell checker
    (require 'flyspell)
    (flyspell-mode t))

  (add-hook 'LaTeX-mode-hook #'mlos/latex-mode-hook))


(provide 'mlos-latex)
