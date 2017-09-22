;;; -*- coding: utf-8-unix -*-
;;; ots-woman-mode.el

(defun ots-woman-mode-rename-buffer ()
  "Rename woman buffer according to the man page name."
  (let ((name (buffer-name)))
    (if (string-match-p "WoMan [0-9]+" name)
        (rename-buffer (replace-match "man" t nil name nil) t))))

(add-hook 'woman-mode-hook 'ots-woman-mode-rename-buffer t)
(setq-default woman-use-own-frame nil)

(provide 'ots-woman-mode)
;;; ots-woman-mode.el ends here
