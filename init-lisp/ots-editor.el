;;; -*- coding: utf-8 -*-
;;; ots-editor.el

(blink-cursor-mode 0)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(scroll-bar-mode 0)
(set-fringe-mode '(6 . 6))
(setq auto-window-vscroll nil)
(setq backward-delete-char-untabify-method 'hungry)
(setq compilation-scroll-output t)
(setq font-lock-maximum-decoration t)
(setq frame-title-format "%+%b")
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq mouse-drag-copy-region nil)
(setq require-final-newline t)
(setq ring-bell-function (lambda () (message "*beep*")))
(setq same-window-regexps '("^[a-zA-Z0-9_]"))
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq server-raise-frame nil)
(setq sort-fold-case t)
(setq use-file-dialog nil)
(setq x-select-enable-clipboard t)
(setq-default fill-column 80)
(setq-default line-spacing 2)
(setq-default major-mode 'text-mode)
(show-paren-mode t)
(tool-bar-mode 0)
(transient-mark-mode t)

;; Deactivate selection when switching buffers.
;; XXX: This is fucking suboptimal...
(require 'ots-tabbar)
(advice-add 'switch-to-buffer :before #'deactivate-mark)
(advice-add 'tabbar-forward-tab :before #'deactivate-mark)
(advice-add 'tabbar-backward-tab :before #'deactivate-mark)

;; XXX: Work around sometimes broken fontification.
(add-hook 'change-major-mode-hook 'font-lock-fontify-buffer t)

(provide 'ots-editor)
;;; ots-editor.el ends here
