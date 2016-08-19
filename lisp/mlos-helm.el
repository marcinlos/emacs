;;; Helm configuration

(use-package helm
  :ensure t
  :diminish helm-mode

  :init
  (helm-mode)
  :config
  (require 'helm-config))


(use-package helm-regexp
  :commands helm-occur)

(use-package helm-ring
  :commands helm-all-mark-rings)


(use-package helm-config
  :init
  ;; unbind helm default prefix key
  (unbind-key "C-x c")
  (mlos/describe-keys
   "C-c h" "helm")

  :config
  (setq helm-split-window-in-side-p t
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)

  :bind-keymap (("C-c h" . helm-command-map))
  :bind (
         :map helm-map
         ("<tab>" . helm-execute-persistent-action))

  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("C-h a" . helm-apropos)
         :map helm-command-map
         ("o" . helm-occur)
         ("SPC" . helm-all-mark-rings)))


(provide 'mlos-helm)
