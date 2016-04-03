;;; Backup configuration

;; Backups in separate directory
(defconst mlos/backup-dir
  (expand-file-name "~/.emacs-backups/")
  "Backup directory")

;; Create it if it does not exist
(unless (file-exists-p mlos/backup-dir)
  (make-directory mlos/backup-dir))


;; Backup files (by default sth~)
(setq backup-directory-alist `((".*" . ,mlos/backup-dir)))

;; Autosave files (by default #sth#)
(setq auto-save-file-name-transforms `((".*" ,mlos/backup-dir t)))


(provide 'mlos-backup)
