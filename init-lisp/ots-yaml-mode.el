;;; -*- coding: utf-8 -*-
;;; ots-yaml-mode.el

(define-derived-mode ots-yaml-mode prog-mode "YAML"
  "Mode for editing YAML files."
  (setq major-mode 'ots-yaml-mode mode-name "YAML")
  (run-hooks 'ots-yaml-mode-hook))

(defun ots-yaml-mode-set-faces ()
  "Set faces for editing YAML files."
  (font-lock-add-keywords
   nil '(("\\(#.*$\\)" 1 font-lock-comment-face)
         ("^\\([a-z_]+:\\)" 1 font-lock-function-name-face))))

(defun ots-yaml-mode-set-properties ()
  "Set properties for editing YAML files."
  (setq-local fill-column 72)
  (setq-local tab-width 2))

(autoload 'ots-yaml-mode "yaml" "YAML" t)
(add-hook 'ots-yaml-mode-hook 'ots-yaml-mode-set-faces)
(add-hook 'ots-yaml-mode-hook 'ots-yaml-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . ots-yaml-mode))
(modify-coding-system-alist 'file "\\.yaml\\'" 'utf-8)

(provide 'ots-yaml-mode)
;;; ots-yaml-mode.el ends here
