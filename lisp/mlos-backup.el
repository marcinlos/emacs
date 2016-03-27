;;; Backup configuration

;; Backups in separate directory
(defconst mlos-backup-dir "~/.emas-backups" "Backup directory")

;; Backup files (by default sth~)
(setq backup-directory-alist `((".*" . ,mlos-backup-dir)))

;; Autosave files (by default #sth#)
(setq auto-save-file-name-transforms `((".*" ,mlos-backup-dir t)))


(provide 'mlos-backup)
