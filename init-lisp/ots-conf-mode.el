;;; -*- coding: utf-8 -*-
;;; ots-conf-mode.el

(defun ots-conf-mode-set-properties ()
  "Set properties for editing configuration files."
  (conf-quote-normal nil)
  (setq-local fill-column 72))

(add-hook 'conf-mode-hook 'ots-conf-mode-set-properties)

;; Use conf-mode for Freedesktop.org and GNOME key files.
(add-to-list 'auto-mode-alist '("\\.desktop\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.theme\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.thumbnailer\\'" . conf-mode))

(provide 'ots-conf-mode)
;;; ots-conf-mode.el ends here
