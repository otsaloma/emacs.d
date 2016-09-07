;;; -*- coding: utf-8 -*-
;;; ots-theme.el

(defvar ots-theme-current nil
  "Currently active theme (last enabled to be exact).")

(defun ots-theme-enable (theme)
  "Load and enable theme: either 'dark' or 'light'."
  (when (string= theme "dark")
    (require 'ots-theme-dark)
    (enable-theme 'ots-dark)
    (setq ots-theme-current theme))
  (when (string= theme "light")
    (require 'ots-theme-light)
    (enable-theme 'ots-light)
    (setq ots-theme-current theme)))

(defun ots-theme-toggle ()
  "Toggle between dark and light themes."
  (interactive)
  (if (string= ots-theme-current "dark")
      (ots-theme-enable "light")
    (ots-theme-enable "dark")))

(ots-theme-enable "dark")
(global-set-key (kbd "<S-f11>") 'ots-theme-toggle)

;; Disable italic for font support is poor.
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :slant 'normal)

;; For font used on Unix, see ~/.Xresources.
(when (eq system-type 'windows-nt)
  (set-frame-font "Meslo LG M-10"))

(provide 'ots-theme)
;;; ots-theme.el ends here
