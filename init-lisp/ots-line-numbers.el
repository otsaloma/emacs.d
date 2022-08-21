;;; -*- coding: utf-8 -*-
;;; ots-line-numbers.el

(defun ots-line-numbers-enable ()
  "Turn display-line-numbers-mode on if in a normal buffer."
  (if (not (derived-mode-p 'comint-mode 'compilation-mode 'vterm-mode))
      (display-line-numbers-mode 1)))

(add-hook 'after-change-major-mode-hook 'ots-line-numbers-enable)
(setq display-line-numbers-grow-only t)

(provide 'ots-line-numbers)
;;; ots-line-numbers.el ends here
