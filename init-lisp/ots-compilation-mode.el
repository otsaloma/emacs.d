;;; -*- coding: utf-8 -*-
;;; ots-compilation-mode.el

(defun ots-compilation-mode-set-properties ()
  "Set properties for compilation buffers."
  (setq truncate-partial-width-windows nil))

(add-hook 'compilation-mode-hook 'ots-compilation-mode-set-properties)

(provide 'ots-compilation-mode)
;;; ots-compilation-mode.el ends here
