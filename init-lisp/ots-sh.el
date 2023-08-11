;;; -*- coding: utf-8 -*-
;;; ots-sh.el

(defun ots-sh-set-properties ()
  "Set properties for editing shell scripts."
  (ots-util-bind-key-compile (kbd "<f5>") "bash %s")
  (ots-util-bind-key-compile (kbd "<f8>") "shellcheck -f gcc %s")
  (setq-local dash-docs-docsets '("Bash")))

(use-package sh-script
  :mode ("\\.env\\'" . sh-mode)
  :config
  (add-hook 'sh-mode-hook 'ots-sh-set-properties))

(provide 'ots-sh)
;;; ots-sh.el ends here
