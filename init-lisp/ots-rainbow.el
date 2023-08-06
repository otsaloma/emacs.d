;;; -*- coding: utf-8 -*-
;;; ots-rainbow.el

(defvar ots-rainbow-modes
  '(conf-mode css-mode emacs-lisp-mode ess-r-mode inferior-ess-r-mode
    json-mode latex-mode)
  "Modes in which to color hexadecimal color codes.")

(defun ots-rainbow-enable ()
  "Enable rainbow-mode to color color strings."
  (if (member major-mode ots-rainbow-modes)
      (rainbow-mode)))

(add-hook 'after-change-major-mode-hook 'ots-rainbow-enable)

(provide 'ots-rainbow)
;;; ots-rainbow.el ends here
