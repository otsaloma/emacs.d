;;; -*- coding: utf-8 -*-
;;; ots-rainbow-mode.el

(require 'rainbow-mode)

(defvar ots-rainbow-mode-no-modes
  '(change-log-mode text-mode woman-mode)
  "Modes in which to not color hexadecimal color codes.")

(defun ots-rainbow-mode-enable ()
  "Enable rainbow-mode to color color strings."
  (if (not (member major-mode ots-rainbow-mode-no-modes))
      (rainbow-mode)))

(add-hook 'after-change-major-mode-hook 'ots-rainbow-mode-enable)

(provide 'ots-rainbow-mode)
;;; ots-rainbow-mode.el ends here
