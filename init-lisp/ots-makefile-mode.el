;;; -*- coding: utf-8 -*-
;;; ots-makefile-mode.el

(defun ots-makefile-mode-set-properties ()
  "Set properties for editing Makefiles."
  (setq-local dash-docs-docsets '("Make"))
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local whitespace-style (quote (face tabs tab-mark))))

(add-hook 'makefile-mode-hook 'ots-makefile-mode-set-properties)
(modify-coding-system-alist 'file "Makefile\\'" 'utf-8)

(provide 'ots-makefile-mode)
;;; ots-makefile-mode.el ends here
