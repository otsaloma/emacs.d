;;; -*- coding: utf-8 -*-
;;; ots-bat-mode.el

(defun ots-bat-mode-run ()
  "Execute the current buffer as a batch file."
  (interactive)
  (executable-interpret (buffer-file-name)))

(defun ots-bat-mode-set-properties ()
  "Set properties for editing batch files."
  (local-set-key (kbd "<f5>") 'ots-bat-mode-run)
  (setq-local dash-docs-docsets '("DOS")))

(add-hook 'bat-mode-hook 'ots-bat-mode-set-properties)
(add-hook 'dos-mode-hook 'ots-bat-mode-set-properties)
(modify-coding-system-alist 'file "\\.bat\\'" 'cp850)
(modify-coding-system-alist 'file "\\.cmd\\'" 'cp850)

(provide 'ots-bat-mode)
;;; ots-bat-mode.el ends here
