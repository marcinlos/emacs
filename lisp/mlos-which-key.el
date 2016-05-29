;;; which-key configuration

;; Display binding completions
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :demand
  :config
  (setq which-key-idle-delay 0.6
        ;; no delay for subsequent keys
        which-key-idle-secondary-delay 0)

  (which-key-mode)

  (defun mlos/describe-keys (&rest args)
    "Name a prefix key sequence, for use of `which-key-mode'"
    (apply #'which-key-add-key-based-replacements args))

  (mlos/describe-keys
   "C-h" "help"
   "C-x r" "registers/rectangles"
   "C-x C-k" "kbd macros"
   "C-x 4" "other window"
   "C-x 5" "other frame"
   "C-x a" "abbrevs"
   "C-x n" "narrow"
   "C-x ESC" "repeat complex cmd"
   "C-x 8" "special chars"
   "C-x 6" "two columns"
   "C-x @" "modifiers"
   "C-x RET" "encoding")

  :bind (("C-h C-b" . which-key-show-top-level)))

;; Display unbinded keys
(use-package free-keys
  :ensure t
  :bind (("C-h C-k" . free-keys)))

;; Bindings that stick
(use-package hydra
  :ensure t)

(provide 'mlos-which-key)
