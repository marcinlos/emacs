;;; Text editing utilities (bindings etc.)


;; Indentation with spaces
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Indent automatically on return
(electric-indent-mode)

;; Tab indents if necessary, otherwise completes
(setq tab-always-indent 'complete)

;; Align by regexp
(bind-key "C-x \\" #'align-regexp)

;; Fix white-space problems
(bind-key "C-x w" #'whitespace-cleanup)

;; Additional functionality for copying
(use-package easy-kill
  :ensure t
  :bind
  (([remap kill-ring-save] . easy-kill)
   ([remap mark-sexp] . easy-mark)))

;; Move lines
(use-package move-text
  :ensure t
  :bind
  (("M-P" . move-text-up)
   ("M-N" . move-text-down)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-+"         . mc/mark-next-like-this)
         ("C-M-+"       . mc/mark-previous-like-this)
         ("C-_"         . mc/unmark-next-like-this)
         ("C-M-_"       . mc/unmark-previous-like-this)
         ("C-c m m"     . mc/mark-all-dwim)
         ("C-c m r"     . mc/mark-all-in-region)
         ("C-c m l l"   . mc/edit-lines)
         ("C-c m l a"   . mc/edit-beginnings-of-lines)
         ("C-c m l e"   . mc/edit-ends-of-lines)
         ("C-<mouse-1>" . mc/add-cursor-on-click))
  :init
  ;; by default this event opens a menu
  (unbind-key "C-<down-mouse-1>")
  (mlos/describe-keys
   "C-c m" "multiple cursors"
   "C-c m l" "lines"))

;; Don't disable commands
(dolist (cmd '(upcase-region downcase-region))
  (put cmd 'disabled nil))

;; Toggle comments with C-;
(defun mlos/toggle-comment ()
  "Toggles comment of selected region or current line"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(bind-key "C-;" #'mlos/toggle-comment)

;; Let C-M-backspace kill text backward to indentation
(defun mlos/kill-backward-to-indentation ()
  "Kills text backward to the first non-white-space character on this line"
  (interactive)
  (back-to-indentation)
  (kill-line))

(bind-key "<C-M-backspace>" #'mlos/kill-backward-to-indentation)


;; Better expanding
(bind-key "M-/" #'hippie-expand)

;; Override marked text
(delete-selection-mode)

;; Improved zap-to-char
(use-package zop-to-char
  :ensure t
  :bind (("M-z" . zop-to-char)
         ("M-Z" . zop-up-to-char)))

;; Expand selection by semantic units
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("C-M-=" . er/contract-region)))

;; More natural undo/redo system
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (unbind-key "C-_" undo-tree-map))

;; Make `eval-expression' more pleasant
(defun mlos/setup-eval-expression-minibuffer ()
  (eldoc-mode)
  (paredit-mode))

(add-hook 'eval-expression-minibuffer-setup-hook #'mlos/setup-eval-expression-minibuffer)


(provide 'mlos-editing)
