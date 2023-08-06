;;; -*- coding: utf-8 -*-
;;; ots-diff.el

(defun ots-diff-set-properties ()
  "Set properties for editing diff files."
  (setq-local truncate-lines t))

(add-hook 'diff-mode-hook 'ots-diff-set-properties)

(provide 'ots-diff)
;;; ots-diff.el ends here
