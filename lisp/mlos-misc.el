;;; Miscellaneous pieces of configuration not fitting any other place


;; Use IBuffer instead of built-in buffer manager
(use-package ibuffer
  :bind (([remap list-buffers] . ibuffer))
  :config

  (defun mlos/ibuffer-ido-find-file (file)
    "Analogous to `ibuffer-find-file', but uses `ido'"
    (interactive
     (let ((default-dir (let ((buf (ibuffer-current-buffer)))
                          (if (buffer-live-p buf)
                              (with-current-buffer buf
                                default-directory)
                            default-directory))))
       (list (ido-read-file-name "Find file:" default-dir))))
    (find-file file))

  ;; use ido version
  (bind-key [remap ibuffer-find-file] #'mlos/ibuffer-ido-find-file)
  ;; conflicts with custom other-window binding
  (unbind-key "M-o" ibuffer-mode-map))

;; Group buffers by projectile project
(use-package ibuffer-vc
  :ensure t
  :init
  (defun mlos/ibuffer-group-by-project ()
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  (add-hook 'ibuffer-hook #'mlos/ibuffer-group-by-project))


;; Answer prompt with one letter
(fset 'yes-or-no-p 'y-or-n-p)

;; Display partially entered commands faster
(setq echo-keystrokes 0.1)

;; Show function signature in the echo area
(use-package eldoc
  :diminish eldoc-mode
  :defer t
  :config
  ;; No delay, lowercase arguments
  (setq eldoc-idle-delay 0
        eldoc-argument-case 'downcase))

;; Auto-revert
(use-package autorevert
  :diminish auto-revert-mode)

;; Diminish abbrev mode
(use-package abbrev
  :diminish abbrev-mode)

;; Better naming for buffers with same name
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward
        uniquify-separator "/"
        uniquify-after-kill-buffer-p t))

;; Load dired (we want C-x C-j)
(use-package dired
  :config
  (require 'dired-x)
  (setq dired-auto-revert-buffer t
        ;; l - mandatory
        ;; a - list all files
        ;; h - human-readable sizes
        ;; v - natural sorting (GNU)
        ;; group-directories-first (GNU)
        dired-listing-switches "-lahv --group-directories-first"))


(provide 'mlos-misc)
