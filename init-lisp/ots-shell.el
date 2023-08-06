;;; -*- coding: utf-8 -*-
;;; ots-shell.el

(defun ots-shell-set-properties ()
  "Set properties for interactive shell sessions."
  (dirtrack-mode 1)
  (setq-local font-lock-comment-face nil)
  (setq-local font-lock-string-face nil)
  (setq-local line-spacing 0))

(add-hook 'shell-mode-hook 'ots-shell-set-properties)
(setq dirtrack-list '("[a-z]+ @ .* : \\(.*\\)$" 1 t))

(provide 'ots-shell)
;;; ots-shell.el ends here
