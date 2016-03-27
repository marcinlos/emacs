;;; Configuration for AUCTeX

(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; for multi-project files - prompt for master file
(setq-default TeX-master nil)

;; Enable spellchecker for LaTeX files
(require 'flyspell)
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode t)))

(provide 'mlos-auctex)
