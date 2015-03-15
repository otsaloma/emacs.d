;;; -*- coding: utf-8 -*-
;;; ots-display.el

(blink-cursor-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(scroll-bar-mode 0)
(setq frame-title-format "%+%b")
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq ring-bell-function (lambda () (message "*beep*")))
(setq same-window-regexps '("^[a-zA-Z0-9_]"))
(setq server-raise-frame nil)
(setq use-file-dialog nil)
(setq-default line-spacing 2)
(tool-bar-mode 0)

(provide 'ots-display)
;;; ots-display.el ends here
