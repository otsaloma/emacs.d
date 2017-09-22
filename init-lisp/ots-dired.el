;;; -*- coding: utf-8 -*-
;;; ots-dired.el

(defun ots-dired-set-properties ()
  "Set properties for browsing dired buffers."
  ;; Reuse the same dired buffer when opening a directory.
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") 'ots-dired-up)
  (define-key dired-mode-map (kbd "<M-up>") 'ots-dired-up))

(defun ots-dired-up ()
  "Navigate to the parent directory."
  (interactive)
  (find-alternate-file ".."))

(add-hook 'dired-mode-hook 'ots-dired-set-properties)

(provide 'ots-dired)
;;; ots-dired.el ends here
