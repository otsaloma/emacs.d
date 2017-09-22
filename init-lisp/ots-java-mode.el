;;; -*- coding: utf-8 -*-
;;; ots-java-mode.el

(defun ots-java-mode-set-properties ()
  "Set properties for editing Java files."
  (c-set-style "k&r")
  (setq-local c-basic-offset 4))

(add-hook 'java-mode-hook 'ots-java-mode-set-properties)

(provide 'ots-java-mode)
;;; ots-java-mode.el ends here
