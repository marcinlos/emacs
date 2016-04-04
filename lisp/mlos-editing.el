;;; Text editing utilities (bindings etc.)


;; Indentation with spaces
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Indent automatically on return
(electric-indent-mode)

;; Tab indents if necessary, otherwise completes
(setq tab-always-indent 'complete)

;; Align by regex
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Toggle comments with C-;
(defun mlos/toggle-comment ()
  "Toggles comment of selected region or current line"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-;") 'mlos/toggle-comment)

;; Let C-M-backspace kill text backward to indentation
(defun mlos/kill-backward-to-indentation ()
  "Kills text backward to the first non-white-space character on this line"
  (interactive)
  (back-to-indentation)
  (kill-line))

(global-set-key (kbd "<C-M-backspace>") 'mlos/kill-backward-to-indentation)


;; Better expanding
(global-set-key (kbd "M-/") 'hippie-expand)

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

;; Jump to location marked by letter
(use-package avy
  :ensure t
  :bind (("C-'" . avy-goto-char-2)
         ("C-\"" . avy-goto-char-timer)
         ("C-M-'" . avy-pop-mark)))

;; Follow links marked by letter
(use-package ace-link
  :ensure t
  :config
  (ace-link-setup-default))

;; Jump/delete window marked by letter
(use-package ace-window
  :ensure t
  :bind (("M-p" . ace-window))
  :config
  ;; use home row to address windows
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; More natural undo/redo system
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

;; Sub-word movement
(use-package subword
  :diminish subword-mode
  ;; don't load, just diminish if loaded
  :defer t)

(provide 'mlos-editing)
