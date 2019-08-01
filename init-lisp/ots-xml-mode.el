;;; -*- coding: utf-8 -*-
;;; ots-xml-mode.el

(defun ots-xml-mode-set-properties ()
  "Set properties for editing XML files."
  (setq-local tab-width 2))

(add-hook 'nxml-mode-hook 'ots-xml-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.svg\\'" . xml-mode))
(modify-coding-system-alist 'file "\\.xml\\'" 'utf-8)

(provide 'ots-xml-mode)
;;; ots-xml-mode.el ends here
