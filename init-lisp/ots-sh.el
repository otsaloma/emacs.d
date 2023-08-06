;;; -*- coding: utf-8 -*-
;;; ots-sh.el

(defun ots-sh-set-properties ()
  "Set properties for editing shell scripts."
  (ots-util-bind-key-compile (kbd "<f5>") "bash %s")
  (ots-util-bind-key-compile (kbd "<f8>") "shellcheck -f gcc %s")
  (setq-local dash-docs-docsets '("Bash")))

(use-package sh-script
  :config
  (add-hook 'sh-mode-hook 'ots-sh-set-properties)
  (add-to-list 'auto-mode-alist '("\\.env\\'" . sh-mode))
  (modify-coding-system-alist 'file "\\.sh\\'" 'utf-8))

(provide 'ots-sh)
;;; ots-sh.el ends here
