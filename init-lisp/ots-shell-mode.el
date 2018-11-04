;;; -*- coding: utf-8 -*-
;;; ots-shell-mode.el

(defun ots-shell-mode-set-properties ()
  "Set properties for interactive shell sessions."
  (dirtrack-mode 1)
  (setq-local font-lock-comment-face nil)
  (setq-local font-lock-string-face nil)
  (setq-local line-spacing 0))

(add-hook 'shell-mode-hook 'ots-shell-mode-set-properties)
(setq dirtrack-list '("[a-z]+ @ .* : \\(.*\\)$" 1 t))

(provide 'ots-shell-mode)
;;; ots-shell-mode.el ends here
