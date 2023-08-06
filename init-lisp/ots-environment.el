;;; -*- coding: utf-8 -*-
;;; ots-environment.el

(use-package emacs
  :config
  ;; Don't propagate to subprocesses.
  (setenv "GDK_DPI_SCALE" nil)
  (setenv "GDK_SCALE" nil)
  (setenv "GTK_THEME" nil))

(use-package direnv
  :config (direnv-mode))

(provide 'ots-environment)
;;; ots-environment.el ends here
