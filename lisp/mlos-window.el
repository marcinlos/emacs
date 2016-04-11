;;; Window related configuration


;; Save/restore window configuration
(use-package winner
  :config
  (winner-mode)
  (unbind-key "C-c <left>" winner-mode-map)
  (unbind-key "C-c <right>" winner-mode-map))


(bind-keys :prefix-map mlos-window-operations-map
           :prefix "C-c w"
           ("s" . split-window-vertically)
           ("v" . split-window-horizontally)
           ("q" . delete-window)
           ("f" . find-file-other-window)
           ("b" . switch-to-buffer-other-window)
           ("u" . winner-undo)
           ("U" . winner-redo)
           ("=" . balance-windows)
           ("<" . shrink-window-horizontally)
           (">" . enlarge-window-horizontally)
           ("-" . shrink-window)
           ("+" . enlarge-window)
           ("_" . shrink-window-if-larger-than-buffer)
           ("h" . windmove-left)
           ("l" . windmove-right)
           ("j" . windmove-down)
           ("k" . windmove-up))

(mlos/describe-keys "C-c w" "windows")

(provide 'mlos-window)
