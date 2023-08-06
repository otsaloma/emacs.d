;;; -*- coding: utf-8 -*-
;;; ots-java.el

(defun ots-java-set-properties ()
  "Set properties for editing Java files."
  (c-set-style "k&r")
  (setq-local c-basic-offset 4))

(add-hook 'java-mode-hook 'ots-java-set-properties)

(provide 'ots-java)
;;; ots-java.el ends here
