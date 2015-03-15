;;; -*- coding: utf-8 -*-
;;; ots-backup.el

(defvar ots-backup-directory
  (concat temporary-file-directory "emacs/backup/")
  "Directory to save backup files in.")

(setq backup-by-copying t)
(setq backup-directory-alist (list (cons "." ots-backup-directory)))
(setq delete-old-versions t)
(setq kept-new-versions 10)
(setq kept-old-versions 10)
(setq make-backup-files t)
(setq version-control t)

(make-directory ots-backup-directory t)

(provide 'ots-backup)
;;; ots-backup.el ends here
