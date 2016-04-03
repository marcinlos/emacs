;;; Miscellaneous pieces of configuration not fitting any other place


;; Move between windows with S-(arrow)
(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

;; Save/restore window configuration
(use-package winner
  :bind ("C-x l" . winner-undo)
  :config
  (winner-mode))

;; Scrolling
(setq-default scroll-conservatively 100
              scroll-margin 3
              scroll-preserve-screen-position t)

;; Switch windows with M-o
(global-set-key (kbd "M-o") 'other-window)

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

  (define-key ibuffer-mode-map (kbd "C-x C-f") 'mlos/ibuffer-ido-find-file)
  ;; conflicts with custom other-window binding
  (define-key ibuffer-mode-map (kbd "M-o") nil))


;; Answer prompt with one letter
(fset 'yes-or-no-p 'y-or-n-p)

;; Display partially entered commands faster
(setq echo-keystrokes 0.1)

(use-package eldoc
  :diminish ""
  :config
  ;; No delay for ElDoc
  (setq eldoc-idle-delay 0))

;; Auto-revert
(use-package autorevert
  :diminish auto-revert-mode)

;; Better naming for buffers with same name
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward
        uniquify-separator "/"
        uniquify-after-kill-buffer-p t))

;; Load dired (we want C-x C-j)
(use-package dired
  :config
  (require 'dired-x))


(provide 'mlos-misc)
