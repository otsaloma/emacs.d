;;; -*- coding: utf-8 -*-
;;; ots-c++-mode.el

(defun ots-c++-mode-set-properties ()
  "Set properties for editing C++ files."
  (c-set-style "k&r")
  (setq-local c-basic-offset 4))

(add-hook 'c++-mode-hook 'ots-c++-mode-set-properties)

(provide 'ots-c++-mode)
;;; ots-c++-mode.el ends here
