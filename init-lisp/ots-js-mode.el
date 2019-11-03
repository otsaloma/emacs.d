;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(defun ots-js-mode-set-properties ()
  "Set properties for editing JavaScript files."
  (when (eq major-mode 'js-mode)
    (font-lock-add-keywords
     nil '(("\\<\\(self\\|that\\|this\\)\\>" 1 font-lock-variable-name-face))))
  (ots-util-add-imenu-expressions
   '((nil "^const +\\([^ ]+\\) += +(.*) +=>", 1)
     (nil "^function +\\([^(]+\\)(" 1)))
  (if (ots-util-buffer-contains " = require(")
      (ots-js-mode-set-properties-node)
    (ots-js-mode-set-properties-browser)))

(defun ots-js-mode-set-properties-browser ()
  "Set properties for editing Browser JavaScript files."
  (ots-util-bind-key-compile (kbd "<f8>") "jshint --reporter=unix %s")
  (setq-local flycheck-checker 'javascript-jshint)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery"))
  (setq-local js-indent-level 4)
  (setq-local tab-width 4))

(defun ots-js-mode-set-properties-node ()
  "Set properties for editing Node.js JavaScript files."
  (ots-util-bind-key-compile (kbd "<f8>") "standard %s")
  (setq-local flycheck-checker 'javascript-standard)
  (setq-local helm-dash-docsets '("JavaScript" "Node"))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2))

(defun ots-js-mode-tide ()
  "Set auto-completion via tide."
  (when (or (eq major-mode 'js-mode)
            (eq major-mode 'rjsx-mode))
    (tide-setup)
    (company-mode +1)
    (eldoc-mode +1)
    (flycheck-mode +1)
    (setq-local company-backends '((company-tide
                                    company-keywords
                                    company-dict
                                    company-dabbrev-code
                                    company-dabbrev)))))

(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-hook 'js-mode-hook 'ots-js-mode-tide)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
