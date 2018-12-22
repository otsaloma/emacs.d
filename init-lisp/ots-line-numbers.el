;;; -*- coding: utf-8 -*-
;;; ots-line-numbers.el

(defun ots-line-numbers-enable ()
  "Turn display-line-numbers-mode on if in a normal buffer."
  (catch 'found
    (dolist (mode ots-normal-modes)
      (when (derived-mode-p mode)
        (display-line-numbers-mode 1)
        (throw 'found t)))))

(add-hook 'after-change-major-mode-hook 'ots-line-numbers-enable)
(setq display-line-numbers-grow-only t)

(provide 'ots-line-numbers)
;;; ots-line-numbers.el ends here
