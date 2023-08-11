;;; -*- coding: utf-8 -*-
;;; ots-c.el

(defun ots-c-set-properties ()
  "Set properties for editing C files."
  (c-set-style "k&r")
  (setq-local c-basic-offset 4))

(use-package cc-mode
  :defer t
  :config
  (add-hook 'c-mode-hook 'ots-c-set-properties))

(provide 'ots-c)
;;; ots-c.el ends here
