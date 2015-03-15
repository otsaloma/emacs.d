;;; -*- coding: utf-8 -*-
;;; ots-shell-mode.el

(defun ots-shell-mode-set-faces ()
  "Set fonts and colors for interactive shell sessions."
  (set (make-local-variable 'font-lock-comment-face) nil)
  (set (make-local-variable 'font-lock-string-face) nil))

(defun ots-shell-mode-set-properties ()
  "Set properties for interactive shell sessions."
  (dirtrack-mode 1)
  (set (make-local-variable 'line-spacing) 0)
  (set-process-query-on-exit-flag (get-process "shell") nil))

(add-hook 'shell-mode-hook 'ots-shell-mode-set-faces)
(add-hook 'shell-mode-hook 'ots-shell-mode-set-properties)

(if (eq system-type 'windows-nt)
    (setq dirtrack-list '("\\(.*\\)\n> " 1 t))
  (setq dirtrack-list '("[a-z]+ @ .* : \\(.*\\)$" 1 t)))

(provide 'ots-shell-mode)
;;; ots-shell-mode.el ends here
