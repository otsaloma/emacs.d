;;; -*- coding: utf-8 -*-
;;; ots-yaml.el

(defun ots-yaml-set-properties ()
  "Set properties for editing YAML files."
  (setq-local fill-column 72)
  (setq-local tab-width 2))

(use-package yaml-mode
  :defer t
  :config
  (add-hook 'yaml-mode-hook 'ots-yaml-set-properties))

(provide 'ots-yaml)
;;; ots-yaml.el ends here
