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


(provide 'mlos-editing)
