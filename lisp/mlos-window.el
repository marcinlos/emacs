;;; Window related configuration


;; Save/restore window configuration
(use-package winner
  :config
  (winner-mode)
  (unbind-key "C-c <left>" winner-mode-map)
  (unbind-key "C-c <right>" winner-mode-map))


(defhydra mlos-hydra-winsize ()
  "window resizing"
  (">" enlarge-window-horizontally)
  ("<" shrink-window-horizontally)
  ("+" enlarge-window)
  ("-" shrink-window)
  ("=" balance-windows)
  ("_" shrink-window-if-larger-than-buffer))

(bind-keys :prefix-map mlos-window-operations-map
           :prefix "C-c w"
           ("s" . split-window-vertically)
           ("v" . split-window-horizontally)
           ("q" . delete-window)
           ("f" . find-file-other-window)
           ("b" . switch-to-buffer-other-window)
           ("u" . winner-undo)
           ("U" . winner-redo)
           ("=" . mlos-hydra-winsize/balance-windows)
           ("<" . mlos-hydra-winsize/shrink-window-horizontally)
           (">" . mlos-hydra-winsize/enlarge-window-horizontally)
           ("-" . mlos-hydra-winsize/shrink-window)
           ("+" . mlos-hydra-winsize/enlarge-window)
           ("_" . mlos-hydra-winsize/shrink-window-if-larger-than-buffer)
           ("h" . windmove-left)
           ("l" . windmove-right)
           ("j" . windmove-down)
           ("k" . windmove-up))

(mlos/describe-keys "C-c w" "windows")

(provide 'mlos-window)
