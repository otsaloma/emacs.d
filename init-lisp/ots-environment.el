;;; -*- coding: utf-8 -*-
;;; ots-environment.el

;; Allow Emacs to be started with certain oddities,
;; but don't propagate them to subprocesses.
(setenv "GDK_SCALE" nil)
(setenv "GTK_THEME" nil)

(when (eq system-type 'windows-nt)
  (setenv "PROMPT" "$P$_$G$s")
  ;; Checked to work with wcheck-mode and enchant.
  ;; If other processes fail, define process-coding-system-alist.
  (setq default-process-coding-system '(utf-8 . utf-8)))

(provide 'ots-environment)
;;; ots-environment.el ends here
