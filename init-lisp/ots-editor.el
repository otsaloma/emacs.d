;;; -*- coding: utf-8 -*-
;;; ots-editor.el

(delete-selection-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq auto-window-vscroll nil)
(setq backward-delete-char-untabify-method 'hungry)
(setq compilation-scroll-output t)
(setq font-lock-maximum-decoration t)
(setq mouse-drag-copy-region nil)
(setq require-final-newline t)
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq sort-fold-case t)
(setq x-select-enable-clipboard t)
(setq-default fill-column 80)
(setq-default major-mode 'text-mode)
(show-paren-mode t)
(transient-mark-mode t)

;; Deactivate selection when switching buffers.
;; XXX: This is fucking suboptimal...
(require 'ots-tabbar)
(advice-add 'switch-to-buffer :before #'deactivate-mark)
(advice-add 'tabbar-forward-tab :before #'deactivate-mark)
(advice-add 'tabbar-backward-tab :before #'deactivate-mark)

(provide 'ots-editor)
;;; ots-editor.el ends here
