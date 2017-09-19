;;; -*- coding: utf-8 -*-
;;; ots-json-mode.el

(require 'json-mode)

(defun ots-json-mode-set-properties ()
  "Set properties for editing JSON files."
  (setq fill-column 1000)
  (turn-off-auto-fill))

(add-hook 'json-mode-hook 'ots-json-mode-set-properties)
(modify-coding-system-alist 'file "\\.json\\'" 'utf-8)
(setq json-mode-auto-mode-list '(".jshintrc" ".tern-project"))

(provide 'ots-json-mode)
;;; ots-json-mode.el ends here
