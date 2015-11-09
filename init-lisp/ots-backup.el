;;; -*- coding: utf-8 -*-
;;; ots-backup.el

(defvar ots-backup-directory
  (concat temporary-file-directory "emacs/backup/")
  "Directory to save backup files in.")

(make-directory ots-backup-directory t)
(setq backup-directory-alist `((".*" . ,ots-backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,ots-backup-directory t)))
(setq auto-save-list-file-prefix ots-backup-directory)

(provide 'ots-backup)
;;; ots-backup.el ends here
