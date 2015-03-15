;;; -*- coding: utf-8 -*-
;;; ots-sgml-xml-mode.el

(defun ots-sgml-xml-mode-set-properties ()
  "Set properties for editing XML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq fill-column 1000)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t))

(add-hook 'sgml-xml-mode-hook 'ots-sgml-xml-mode-set-properties)

(provide 'ots-sgml-xml-mode)
;;; ots-sgml-xml-mode.el ends here
