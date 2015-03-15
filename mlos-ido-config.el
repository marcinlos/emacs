;;; Configuration for Ido & smex

;; Ido with improved flex matching
(require 'ido)
(require 'flx-ido)
(ido-mode)
(ido-everywhere)
(flx-ido-mode)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-create-new-buffer 'always)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Smex - ido for commands
(setq smex-save-file "~/.emacs.d/smex.save")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'mlos-ido-config)
