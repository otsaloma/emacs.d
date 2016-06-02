;;; -*- coding: utf-8 -*-
;;; ots-po-mode.el

(defun ots-po-mode-set-keys ()
  "Set keybindings for editing PO files."
  (local-set-key (kbd "C-s") 'ots-util-save-buffer)
  (local-set-key (kbd "C-z") 'po-undo))

(defun ots-po-subedit-mode-set-keys ()
  "Set keybindings for editing PO file entries."
  (define-key po-subedit-mode-map (kbd "C-s") 'po-subedit-exit)
  (define-key po-subedit-mode-map (kbd "C-g") 'po-subedit-abort)
  (set (make-local-variable 'po-subedit-message)
       "Type 'C-s' once done, or 'C-g' to abort edit"))

(add-hook 'po-mode-hook 'ots-po-mode-set-keys)
(add-hook 'po-subedit-mode-hook 'ots-po-subedit-mode-set-keys)
(modify-coding-system-alist 'file "\\.po\\'" 'utf-8)

(provide 'ots-po-mode)
;;; ots-po-mode.el ends here
