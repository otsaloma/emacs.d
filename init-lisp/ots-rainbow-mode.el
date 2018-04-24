;;; -*- coding: utf-8 -*-
;;; ots-rainbow-mode.el

(defvar ots-rainbow-mode-modes
  '(conf-mode css-mode emacs-lisp-mode ess-mode inferior-ess-mode
    json-mode latex-mode)
  "Modes in which to color hexadecimal color codes.")

(defun ots-rainbow-mode-enable ()
  "Enable rainbow-mode to color color strings."
  (if (member major-mode ots-rainbow-mode-modes)
      (rainbow-mode)))

(add-hook 'after-change-major-mode-hook 'ots-rainbow-mode-enable)

(provide 'ots-rainbow-mode)
;;; ots-rainbow-mode.el ends here
