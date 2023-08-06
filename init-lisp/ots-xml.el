;;; -*- coding: utf-8 -*-
;;; ots-xml.el

(defun ots-xml-set-properties ()
  "Set properties for editing XML files."
  (setq-local tab-width 2))

(use-package nxml-mode
  :config
  (add-hook 'nxml-mode-hook 'ots-xml-set-properties)
  (add-to-list 'auto-mode-alist '("\\.svg\\'" . nxml-mode))
  (modify-coding-system-alist 'file "\\.xml\\'" 'utf-8))

(provide 'ots-xml)
;;; ots-xml.el ends here
