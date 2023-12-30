;;; -*- coding: utf-8 -*-
;;; ots-theme.el

(defvar ots-theme-current nil
  "Currently active theme: 'dark' or 'light'.")

(use-package emacs
  :config
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono-10.5"))
  (setq-default line-spacing 0.4)
  (setq font-lock-maximum-decoration t)
  (when (file-exists-p "~/.emacs.d/theme-light")
    (require 'ots-theme-light)
    (enable-theme 'ots-light)
    (setq ots-theme-current "light"))
  (when (or (file-exists-p "~/.emacs.d/theme-dark")
            (not ots-theme-current))
    (require 'ots-theme-dark)
    (enable-theme 'ots-dark)
    (setq ots-theme-current "dark"))
  ;; Disable italics as most monospace fonts don't really have proper italics.
  ;; (set-face-attribute 'italic nil :slant 'normal)
  ;; (set-face-attribute 'bold-italic nil :slant 'normal)
  )

(provide 'ots-theme)
;;; ots-theme.el ends here
