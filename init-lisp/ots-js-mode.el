;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(defun ots-js-mode-set-properties ()
  "Set properties for editing JavaScript files."
  (when (eq major-mode 'js-mode)
    (font-lock-add-keywords
     nil '(("\\<\\(self\\|that\\|this\\)\\>" 1 font-lock-variable-name-face))))
  (ots-util-bind-key-compile (kbd "<f8>") "jshint --reporter=unix %s")
  (ots-util-add-imenu-expressions
   '((nil "^var +\\([^ =]+\\)[ =]" 1)
     (nil "^function +\\([^(]+\\)(" 1)))
  (setq-local helm-dash-docsets '("JavaScript"))
  (ots-util-add-docset "\$\(" "jQuery")
  (ots-util-add-docset "^import" "Node"))

(defun ots-js-mode-tern ()
  "Set auto-completion via tern."
  (when (eq major-mode 'js-mode)
    (tern-mode t)
    (setq-local company-backends '((company-tern
                                    company-keywords
                                    company-dict
                                    company-dabbrev-code
                                    company-dabbrev)))))

(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-hook 'js-mode-hook 'ots-js-mode-tern)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)
(setq tern-command '("tern" "--no-port-file"))

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
