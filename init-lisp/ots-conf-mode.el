;;; -*- coding: utf-8 -*-
;;; ots-conf-mode.el

(let ((modes '(("\\.theme$" . conf-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-conf-mode-set-properties ()
  "Set properties for editing configuration files."
  (conf-quote-normal nil)
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'conf-mode-hook 'ots-conf-mode-set-properties)

(provide 'ots-conf-mode)
;;; ots-conf-mode.el ends here
