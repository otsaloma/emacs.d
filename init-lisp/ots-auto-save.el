;;; -*- coding: utf-8 -*-
;;; ots-auto-save.el

(defvar ots-auto-save-directory
  (concat temporary-file-directory "emacs/auto-save/")
  "Directory to save auto-save files in.")

(defun make-auto-save-file-name ()
  (concat
   ots-auto-save-directory
   (if buffer-file-name
       (concat "#" (file-name-nondirectory buffer-file-name) "#")
     (expand-file-name
      (concat "#%" (buffer-name) "#")))))

(make-directory ots-auto-save-directory t)
(setq auto-save-list-file-name (concat ots-auto-save-directory "list"))
(setq delete-auto-save-files nil)

(provide 'ots-auto-save)
;; ots-auto-save.el ends here
