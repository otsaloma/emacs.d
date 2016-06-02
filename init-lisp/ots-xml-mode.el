;;; -*- coding: utf-8 -*-
;;; ots-xml-mode.el

(add-to-list 'auto-mode-alist '("\\.svg" . xml-mode))

(defun ots-xml-mode-set-properties ()
  "Set properties for editing XML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq-local company-backends
   '((company-nxml :with company-dabbrev)))
  (setq fill-column 1000)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t))

(add-hook 'nxml-mode-hook 'ots-xml-mode-set-properties)
(modify-coding-system-alist 'file "\\.xml\\'" 'utf-8)

(provide 'ots-xml-mode)
;;; ots-xml-mode.el ends here
