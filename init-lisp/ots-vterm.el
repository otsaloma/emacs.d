;;; -*- coding: utf-8 -*-
;;; ots-vterm.el

(require 'vterm)

(defun ots-vterm-set-properties ()
  (local-set-key (kbd "<f3>") 'vterm)
  (setq vterm-max-scrollback 10000))

(add-hook 'change-major-mode-after-body-hook 'ots-vterm-set-properties)

(provide 'ots-vterm)
;;; ots-vterm.el ends here
