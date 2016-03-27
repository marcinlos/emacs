;;; Configuration for Ido & smex

;; Ido with improved flex matching
(require 'ido)
(require 'flx-ido)
(ido-mode)
(ido-everywhere)
(flx-ido-mode)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Vertical mode
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Never ask to confirm creation of new buffer
;; (both are required)
(setq ido-create-new-buffer 'always)
(setq confirm-nonexistent-file-or-buffer nil)

(defvar ido-context-switch-command nil)
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Smex - ido for commands
(setq smex-save-file "~/.emacs.d/smex.save")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'mlos-ido-config)
