;;; -*- coding: utf-8 -*-
;;; ots-editor.el

(delete-selection-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(set-fringe-mode '(6 . 6))
(setq auto-window-vscroll nil)
(setq backward-delete-char-untabify-method 'hungry)
(setq compilation-scroll-output t)
(setq default-major-mode 'text-mode)
(setq font-lock-maximum-decoration t)
(setq mouse-drag-copy-region nil)
(setq require-final-newline t)
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq sort-fold-case t)
(setq x-select-enable-clipboard t)
(setq-default fill-column 80)
(show-paren-mode t)
(transient-mark-mode t)

;; Deactivate selection when switching buffers.
;; XXX: Better would be what shift-select-mode does:
;; "the mark will be deactivated by any subsequent point motion key".
(add-hook 'buffer-list-update-hook 'deactivate-mark)

(provide 'ots-editor)
;;; ots-editor.el ends here
