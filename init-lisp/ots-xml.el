;;; -*- coding: utf-8 -*-
;;; ots-xml.el

(defun ots-xml-set-properties ()
  "Set properties for editing XML files."
  (setq-local tab-width 2))

(use-package nxml-mode
  :mode "\\.svg\\'"
  :config
  (add-hook 'nxml-mode-hook 'ots-xml-set-properties))

(provide 'ots-xml)
;;; ots-xml.el ends here
