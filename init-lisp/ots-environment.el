;;; -*- coding: utf-8 -*-
;;; ots-environment.el

(require 'ots-util)

(when (eq system-type 'windows-nt)
  (setenv "PROMPT" "$P$_$G$s")
  ;; Checked to work with wcheck-mode and voikkospell.
  ;; If other processes fail, define process-coding-system-alist.
  (setq default-process-coding-system '(utf-8 . utf-8)))

(provide 'ots-environment)
;;; ots-environment.el ends here
