;;; -*- coding: utf-8 -*-
;;; ots-compilation.el

(defun ots-compilation-set-properties ()
  "Set properties for compilation buffers."
  (setq-local comint-buffer-maximum-size 1024)
  (setq-local compilation-scroll-output t)
  (setq-local truncate-partial-width-windows nil))

(use-package compile
  :config
  (add-hook 'compilation-mode-hook 'ots-compilation-set-properties)
  (add-hook 'compilation-filter-hook 'comint-truncate-buffer))

(provide 'ots-compilation)
;;; ots-compilation.el ends here
