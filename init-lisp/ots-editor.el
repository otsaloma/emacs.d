;;; -*- coding: utf-8 -*-
;;; ots-editor.el

(defun process-query-on-exit-flag (process)
  "Terminate subprocesses on exit without asking."
  nil)

(use-package emacs
  :config

  (blink-cursor-mode 0)
  (delete-selection-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (menu-bar-mode 0)
  (modify-frame-parameters nil '((wait-for-wm . nil)))
  (pixel-scroll-precision-mode 1)
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (scroll-bar-mode 0)
  (show-paren-mode t)
  (tool-bar-mode 0)
  (transient-mark-mode t)

  (setq frame-resize-pixelwise t)
  (setq frame-title-format "%+%b")
  (setq inhibit-startup-message t)
  (setq initial-scratch-message nil)
  (setq mouse-drag-copy-region nil)
  (setq require-final-newline t)
  (setq ring-bell-function (lambda () (message "*beep*")))
  (setq same-window-regexps '("^[a-zA-Z0-9_]"))
  (setq scroll-conservatively 1000)
  (setq scroll-margin 1)
  (setq scroll-step 1)
  (setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
  (setq sentence-end-double-space nil)
  (setq server-raise-frame nil)
  (setq sort-fold-case t)
  (setq use-file-dialog nil)
  (setq x-select-enable-clipboard t)

  (setq-default cursor-in-non-selected-windows nil)
  (setq-default major-mode 'text-mode)

  ;; Prevent a window split when opening multiple files at once.
  (add-hook 'emacs-startup-hook 'delete-other-windows t)

  ;; Try to handle files with long lines better.
  ;; https://200ok.ch/posts/2020-09-29_comprehensive_guide_on_handling_long_lines_in_emacs.html
  (setq bidi-inhibit-bpa t)
  (setq so-long-action 'so-long-minor-mode)
  (setq so-long-threshold 100000)
  (setq-default bidi-paragraph-direction 'left-to-right)
  (global-so-long-mode 1)

  )

(provide 'ots-editor)
;;; ots-editor.el ends here
