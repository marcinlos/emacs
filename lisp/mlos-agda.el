;;; Agda config

(if (executable-find "agda-mode")
    (let ((agda-file
           (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate"))))
      (load-file agda-file))
  (message "Agda mode executable not found"))

(provide 'mlos-agda)
