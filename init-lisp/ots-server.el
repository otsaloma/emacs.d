;;; -*- coding: utf-8 -*-
;;; ots-server.el

(require 'server)

(defvar ots-server-file
  (expand-file-name server-name server-auth-dir))

(defun ots-server-delete-file ()
   "Delete ots-server-file."
   (condition-case nil
       (delete-file ots-server-file)
     (error nil)))

(if (eq system-type 'windows-nt)
     (add-hook 'kill-emacs-hook 'ots-server-delete-file))

(provide 'ots-server)
;;; ots-server.el ends here
