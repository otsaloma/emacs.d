;;; -*- coding: utf-8 -*-
;;; ots-vterm.el

(require 'vterm)

(global-set-key (kbd "<f3>") 'vterm)
(setq vterm-max-scrollback 10000)

(provide 'ots-vterm)
;;; ots-vterm.el ends here
