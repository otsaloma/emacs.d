;;; -*- coding: utf-8 -*-
;;; ots-jsx-mode.el

(defun ots-jsx-mode-set-properties ()
  "Set properties for editing JSX files."
  (setq-local fill-column 100)
  (setq-local helm-dash-docsets '("HTML" "JavaScript"))
  (setq-local js-indent-level 2)
  (setq-local js2-basic-offset 2)
  (setq-local js2-strict-missing-semi-warning nil)
  (setq-local sgml-basic-offset 2)
  (setq-local tab-width 2)
  ;; Default to standard, use eslint if corresponding config file found.
  (ots-util-bind-key-compile (kbd "<f8>") "standard %s")
  (setq-local flycheck-checker 'javascript-standard)
  (when (or (ots-util-file-above-in-tree default-directory ".eslintignore")
            (ots-util-file-above-in-tree default-directory ".eslintrc.js")
            (ots-util-file-above-in-tree default-directory ".eslintrc.json")
            (ots-util-file-above-in-tree default-directory ".eslintrc.yml"))
    (ots-util-bind-key-compile (kbd "<f8>") "eslint %s")
    (setq-local flycheck-checker 'javascript-eslint)))

(add-hook 'rjsx-mode-hook 'ots-jsx-mode-set-properties)
(add-to-list 'magic-mode-alist '("^import.*[Rr]eact" . rjsx-mode))
(add-to-list 'magic-mode-alist '("^import.*[Rr]edux" . rjsx-mode))

(provide 'ots-jsx-mode)
;;; ots-jsx-mode.el ends here
