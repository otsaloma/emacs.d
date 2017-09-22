;;; -*- coding: utf-8 -*-
;;; ots-trailing-space.el

(defvar ots-trailing-space-no-modes '(diff-mode)
  "Modes in which to not delete trailing whitespace.")

(defvar ots-trailing-space-no-names '("\\.diff\\'" "\\.patch\\'")
  "Filename patterns for which to not delete trailing whitespace.")

(defun ots-trailing-space-delete ()
  "Delete trailing spaces, tabs and blank lines."
  (interactive)
  (let ((do-delete t))
    (if (member major-mode ots-trailing-space-no-modes)
        (setq do-delete nil))
    (dolist (name ots-trailing-space-no-names)
      (if (string-match name (buffer-file-name))
          (setq do-delete nil)))
    (when do-delete
      (delete-trailing-whitespace))))

(add-hook 'before-save-hook 'ots-trailing-space-delete)

(provide 'ots-trailing-space)
;;; ots-trailing-space.el ends here
