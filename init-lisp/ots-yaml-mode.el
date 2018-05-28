;;; -*- coding: utf-8 -*-
;;; ots-yaml-mode.el

(defun ots-yaml-mode-set-properties ()
  "Set properties for editing YAML files."
  (setq-local fill-column 72)
  (setq-local tab-width 2))

(add-hook 'ots-yaml-mode-hook 'ots-yaml-mode-set-properties)
(modify-coding-system-alist 'file "\\.yml\\'" 'utf-8)

(provide 'ots-yaml-mode)
;;; ots-yaml-mode.el ends here
