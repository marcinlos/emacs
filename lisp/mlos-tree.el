;;; Tree project explorer

(use-package project-explorer
  :ensure t
  :bind (("<f2>" . project-explorer-toggle)
         :map project-explorer-mode-map
         ("C-M-o" . pe/toggle-omit))
  :config
  (add-hook 'project-explorer-mode-hook (lambda ()
                                          (unbind-key "M-o" project-explorer-mode-map))))

(provide 'mlos-tree)
