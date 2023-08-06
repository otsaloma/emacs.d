;;; -*- coding: utf-8 -*-
;;; ots-compilation.el

(defun ots-compilation-set-properties ()
  "Set properties for compilation buffers."
  (setq-local comint-buffer-maximum-size 1024)
  (setq-local truncate-partial-width-windows nil))

(add-hook 'compilation-mode-hook 'ots-compilation-set-properties)
(add-hook 'compilation-filter-hook 'comint-truncate-buffer)

(provide 'ots-compilation)
;;; ots-compilation.el ends here
