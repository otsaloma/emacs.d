;;; -*- coding: utf-8 -*-
;;; ots-json-mode.el

(defun ots-json-mode-set-properties ()
  "Set properties for editing JSON files."
  (ots-util-bind-key-compile (kbd "<f9>") "jsonlint %s -cq")
  (turn-off-auto-fill))

(add-hook 'json-mode-hook 'ots-json-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.jshintrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
(modify-coding-system-alist 'file "\\.json\\'" 'utf-8)

(provide 'ots-json-mode)
;;; ots-json-mode.el ends here
