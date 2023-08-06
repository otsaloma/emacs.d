;;; -*- coding: utf-8 -*-
;;; ots-backup.el

(defvar ots-backup-directory
  (concat temporary-file-directory "emacs-backup/")
  "Directory to save backup files in.")

(use-package emacs
  :config
  (add-hook 'change-major-mode-hook #'(lambda () (setq create-lockfiles nil)))
  (make-directory ots-backup-directory t)
  (setq auto-save-file-name-transforms `((".*" ,ots-backup-directory t)))
  (setq auto-save-list-file-prefix ots-backup-directory)
  (setq backup-by-copying t)
  (setq backup-directory-alist `((".*" . ,ots-backup-directory))))

(provide 'ots-backup)
;;; ots-backup.el ends here
