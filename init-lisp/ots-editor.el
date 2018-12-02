;;; -*- coding: utf-8 -*-
;;; ots-editor.el

(defun process-query-on-exit-flag (process)
  "Terminate subprocesses on exit without asking."
  nil)

(blink-cursor-mode 0)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(scroll-bar-mode 0)
(set-fringe-mode (* 6 (ots-util-pixel-ratio)))
(show-paren-mode t)
(tool-bar-mode 0)
(transient-mark-mode t)

(setq backward-delete-char-untabify-method 'hungry)
(setq compilation-scroll-output t)
(setq font-lock-maximum-decoration t)
(setq frame-resize-pixelwise t)
(setq frame-title-format "%+%b")
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq mouse-drag-copy-region nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))
(setq require-final-newline t)
(setq ring-bell-function (lambda () (message "*beep*")))
(setq same-window-regexps '("^[a-zA-Z0-9_]"))
(setq scroll-conservatively 1000)
(setq scroll-margin 0)
(setq scroll-step 1)
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq server-raise-frame nil)
(setq sort-fold-case t)
(setq use-file-dialog nil)
(setq x-select-enable-clipboard t)

(setq-default fill-column 80)
(setq-default major-mode 'text-mode)

;; Prevent a window split when opening multiple files at once.
(add-hook 'emacs-startup-hook 'delete-other-windows t)

(provide 'ots-editor)
;;; ots-editor.el ends here
