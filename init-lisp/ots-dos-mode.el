;;; -*- coding: utf-8 -*-
;;; ots-dos-mode.el

(autoload 'dos-mode "dos" "Edit DOS scripts." t)
(let ((modes '(("\\.\\(bat\\|cmd\\|dos\\)$" . dos-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-dos-mode-run ()
  "Execute the current buffer as a DOS script."
  (interactive)
  (executable-interpret (buffer-file-name)))

(defun ots-dos-mode-set-properties ()
  "Set properties for editing DOS files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'ots-dos-mode-run)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("DOS"))
  (turn-on-auto-fill))

(add-hook 'dos-mode-hook 'ots-dos-mode-set-properties)

(provide 'ots-dos-mode)
;;; ots-dos-mode.el ends here
