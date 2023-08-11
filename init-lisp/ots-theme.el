;;; -*- coding: utf-8 -*-
;;; ots-theme.el

(defvar ots-theme-current nil
  "Currently active theme: 'dark' or 'light'.")

(use-package emacs
  :config
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
  ;; Set line spacing depending on font used.
  (let ((family (face-attribute 'default :family)))
    (setq-default line-spacing
                  (cond ((string= family "Cascadia Code")    0.40)
                        ((string= family "Cascadia Code PL") 0.40)
                        ((string= family "Cascadia Mono")    0.40)
                        ((string= family "Cascadia Mono PL") 0.40)
                        ((string= family "IBM Plex Mono")    0.30)
                        ((string= family "SF Mono")          0.50)))))

(provide 'ots-theme)
;;; ots-theme.el ends here
