;;; -*- coding: utf-8 -*-
;;; ots-sh-mode.el

(require 'ots-theme)
(require 'ots-util)

(defun ots-sh-mode-run ()
  "Execute the current buffer as a shell script."
  (interactive)
  (compile (ots-util-expand-command "sh %s")))

(defun ots-sh-mode-set-faces ()
  "Set fonts and colors for shell scripts."
  (font-lock-add-keywords
   nil
   '(;; Alias definitions
     ("alias +\\([a-z0-9\-]+\\)="
      1 font-lock-variable-name-face)
     ))
  (let ((face (face-foreground 'font-lock-constant-face)))
    (set-face-foreground 'sh-quoted-exec face)))

(defun ots-sh-mode-set-properties ()
  "Set properties for editing shell scripts."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-sh-mode-run)
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (ots-util-set-compile-command "checkbashisms %s")
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("Bash"))
  (turn-on-auto-fill))

(add-hook 'sh-mode-hook 'ots-sh-mode-set-faces)
(add-hook 'sh-mode-hook 'ots-sh-mode-set-properties)

(provide 'ots-sh-mode)
;;; ots-sh-mode.el ends here
