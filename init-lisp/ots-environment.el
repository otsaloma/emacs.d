;;; -*- coding: utf-8 -*-
;;; ots-environment.el

;; Allow Emacs to be started with certain oddities,
;; but don't propagate them to subprocesses.
(setenv "GDK_DPI_SCALE" nil)
(setenv "GDK_SCALE" nil)
(setenv "GTK_THEME" nil)

;; Load project-specific environments from .envrc files.
;; https://github.com/direnv/direnv
(require 'direnv)
(direnv-mode)

(provide 'ots-environment)
;;; ots-environment.el ends here
