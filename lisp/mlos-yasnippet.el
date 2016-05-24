;;; yasnippet configuration

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (mlos/describe-keys "C-c &" "yasnippet")

  (defun mlos/expand-yas-or-open-line ()
    "Call `open-line', unless there is a snippet to expand at point or it is
possible to move to the the next field inside the the snippet."
    (interactive)
    (cond
     ((yas--snippets-at-point) (yas-next-field-or-maybe-expand))
     ((ignore-errors (yas-expand)))
     (t (open-line 1))))
  (yas-global-mode 1)

  :bind ("C-o" . mlos/expand-yas-or-open-line))


(provide 'mlos-yasnippet)
