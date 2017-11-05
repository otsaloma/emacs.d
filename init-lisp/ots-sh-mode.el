;;; -*- coding: utf-8 -*-
;;; ots-sh-mode.el

(defun ots-sh-mode-set-faces ()
  "Set fonts and colors for shell scripts."
  (require 'ots-theme)
  (font-lock-add-keywords
   nil '(("alias +\\([a-z0-9\-]+\\)=" 1 font-lock-variable-name-face)
         ("\\(<*\\<EOF\\>\\)" 1 font-lock-keyword-face)))
  (let ((face (face-foreground 'font-lock-constant-face)))
    (set-face-foreground 'sh-quoted-exec face)))

(defun ots-sh-mode-set-properties ()
  "Set properties for editing shell scripts."
  (ots-util-bind-key-compile (kbd "<f6>") "bash %s")
  (ots-util-bind-key-compile (kbd "<f9>") "shellcheck -f gcc %s")
  (ots-util-set-compile-command "checkbashisms %s")
  (setq-local helm-dash-docsets '("Bash")))

(add-hook 'sh-mode-hook 'ots-sh-mode-set-faces)
(add-hook 'sh-mode-hook 'ots-sh-mode-set-properties)
(modify-coding-system-alist 'file "\\.sh\\'" 'utf-8)

(provide 'ots-sh-mode)
;;; ots-sh-mode.el ends here
