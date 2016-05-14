;;; -*- coding: utf-8 -*-
;;; ots-xml-mode.el

(add-to-list 'auto-mode-alist '("\\.svg" . xml-mode))

(defun ots-xml-mode-set-properties ()
  "Set properties for editing XML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq fill-column 1000)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t))

(add-hook 'nxml-mode-hook 'ots-xml-mode-set-properties)

(provide 'ots-xml-mode)
;;; ots-xml-mode.el ends here
