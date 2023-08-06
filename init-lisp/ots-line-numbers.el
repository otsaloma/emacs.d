;;; -*- coding: utf-8 -*-
;;; ots-line-numbers.el

(defun ots-line-numbers-enable-maybe ()
  "Turn display-line-numbers-mode on if in a normal buffer."
  (if (derived-mode-p 'conf-mode 'po-mode 'prog-mode 'text-mode)
      (display-line-numbers-mode 1)))

(use-package display-line-numbers
  :config
  (add-hook 'after-change-major-mode-hook 'ots-line-numbers-enable-maybe)
  (setq display-line-numbers-grow-only t))

(provide 'ots-line-numbers)
;;; ots-line-numbers.el ends here
