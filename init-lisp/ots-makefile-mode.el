;;; -*- coding: utf-8 -*-
;;; ots-makefile-mode.el

(defun ots-makefile-mode-set-properties ()
  "Set properties for editing Makefiles."
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("Make")))

(add-hook 'makefile-mode-hook 'ots-makefile-mode-set-properties)

(provide 'ots-makefile-mode)
;;; ots-makefile-mode.el ends here
