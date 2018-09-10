;;; -*- coding: utf-8 -*-
;;; ots-jsx-mode.el

(defun ots-jsx-mode-set-properties ()
  "Set properties for editing JSX files."
  (setq-local js-indent-level 2)
  (setq-local js2-basic-offset 2)
  (setq-local tab-width 2))

(add-hook 'rjsx-mode-hook 'ots-jsx-mode-set-properties)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(provide 'ots-jsx-mode)
;;; ots-jsx-mode.el ends here