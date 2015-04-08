;;; -*- coding: utf-8 -*-
;;; ots-rainbow-mode.el

(require 'rainbow-mode)

(defvar ots-rainbow-mode-modes
  '(conf-mode css-mode emacs-lisp-mode ess-mode inferior-ess-mode js-mode
    latex-mode python-mode qml-mode)
  "Modes in which to color hexadecimal color codes.")

(defun ots-rainbow-mode-enable ()
  "Enable rainbow-mode to color color strings."
  (if (member major-mode ots-rainbow-mode-modes)
      (rainbow-mode)))

(add-hook 'after-change-major-mode-hook 'ots-rainbow-mode-enable)

(provide 'ots-rainbow-mode)
;;; ots-rainbow-mode.el ends here
