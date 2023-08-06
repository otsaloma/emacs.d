;;; -*- coding: utf-8 -*-
;;; ots-bat.el

(defun ots-bat-run ()
  "Execute the current buffer as a batch file."
  (interactive)
  (executable-interpret (buffer-file-name)))

(defun ots-bat-set-properties ()
  "Set properties for editing batch files."
  (local-set-key (kbd "<f5>") 'ots-bat-run)
  (setq-local dash-docs-docsets '("DOS")))

(use-package bat-mode
  :config
  (add-hook 'bat-mode-hook 'ots-bat-set-properties)
  (modify-coding-system-alist 'file "\\.bat\\'" 'cp850)
  (modify-coding-system-alist 'file "\\.cmd\\'" 'cp850))

(provide 'ots-bat)
;;; ots-bat.el ends here
