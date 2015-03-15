;;; -*- coding: utf-8 -*-
;;; ots-change-log-mode.el

(let ((modes '(("\\.changes$" . change-log-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-change-log-mode-set-properties ()
  "Set properties for editing ChangeLog files."
  (setq add-log-always-start-new-record t)
  (setq fill-column 80)
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'change-log-mode-hook 'ots-change-log-mode-set-properties)

(provide 'ots-change-log-mode)
;;; ots-change-log-mode.el ends here
