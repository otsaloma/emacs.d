;;; -*- coding: utf-8 -*-
;;; ots-diff-mode.el

(defun ots-diff-mode-set-properties ()
  "Set properties for editing diff files."
  (setq-local truncate-lines t))

(add-hook 'diff-mode-hook 'ots-diff-mode-set-properties)

(provide 'ots-diff-mode)
;;; ots-diff-mode.el ends here
