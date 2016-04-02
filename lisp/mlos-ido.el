;;; Configuration for Ido & smex

;; ido, basic config
(use-package ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  ;; Don't ask to confirm creation of new buffer
  (setq ido-create-new-buffer 'always
        confirm-nonexistent-file-or-buffer nil)
  (ido-mode))

;; Flex matching for ido
(use-package flx-ido
  :ensure t
  :config
  ;; to see highlighted matching parts
  (setq ido-use-faces nil)
  (flx-ido-mode))

;; Use ido everywhere
(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode))

;; Vertical display of ido matches
(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode)
  ;; Use C-n and C-p to traverse match list
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; Smex - ido for commands
(use-package smex
  :ensure t
  :config
  (setq smex-save-file "~/.emacs.d/smex.save")
  (smex-initialize)
  :bind ("M-x" . smex))


(provide 'mlos-ido)
