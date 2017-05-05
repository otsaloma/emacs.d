;;; -*- coding: utf-8 -*-
;;; ots-bat-mode.el

(defun ots-bat-mode-run ()
  "Execute the current buffer as a batch file."
  (interactive)
  (executable-interpret (buffer-file-name)))

(defun ots-bat-mode-set-properties ()
  "Set properties for editing batch files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-bat-mode-run)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("DOS"))
  (turn-on-auto-fill))

(add-hook 'bat-mode-hook 'ots-bat-mode-set-properties)
(add-hook 'dos-mode-hook 'ots-bat-mode-set-properties)
(modify-coding-system-alist 'file "\\.bat\\'" 'cp850)
(modify-coding-system-alist 'file "\\.cmd\\'" 'cp850)

(provide 'ots-bat-mode)
;;; ots-bat-mode.el ends here
