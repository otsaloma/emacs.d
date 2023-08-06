;;; -*- coding: utf-8 -*-
;;; ots-yaml.el

(defun ots-yaml-set-properties ()
  "Set properties for editing YAML files."
  (setq-local fill-column 72)
  (setq-local tab-width 2))

(use-package yaml-mode
  :config
  (add-hook 'yaml-mode-hook 'ots-yaml-set-properties)
  (modify-coding-system-alist 'file "\\.yml\\'" 'utf-8))

(provide 'ots-yaml)
;;; ots-yaml.el ends here
