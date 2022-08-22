;;; -*- coding: utf-8 -*-
;;; ots-whitespace-mode.el

(defun ots-whitespace-mode-enable ()
  "Turn whitespace-mode on if in a normal buffer."
  (if (derived-mode-p 'conf-mode 'prog-mode 'text-mode)
      (whitespace-mode 1)))

(setq whitespace-style
      (quote (face tabs indentation space-after-tab
              space-before-tab tab-mark)))

;; Unicode characters in decimal, see M-x insert-char.
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46]) (tab-mark 9 [62 9])))

(add-hook 'after-change-major-mode-hook 'ots-whitespace-mode-enable)

(provide 'ots-whitespace-mode)
;;; ots-whitespace-mode.el ends here
