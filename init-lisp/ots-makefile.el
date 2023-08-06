;;; -*- coding: utf-8 -*-
;;; ots-makefile.el

(defun ots-makefile-set-properties ()
  "Set properties for editing Makefiles."
  (setq-local dash-docs-docsets '("Make"))
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local whitespace-style (quote (face tabs tab-mark))))

(use-package make-mode
  :config
  (add-hook 'makefile-mode-hook 'ots-makefile-set-properties)
  (modify-coding-system-alist 'file "Makefile\\'" 'utf-8))

(provide 'ots-makefile)
;;; ots-makefile.el ends here
