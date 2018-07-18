;;; -*- coding: utf-8 -*-
;;; ots-theme.el

(defvar ots-theme-current nil
  "Currently active theme (last enabled to be exact).")

(defvar ots-theme-default "dark"
  "The default theme to use at startup.")

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
    (ots-theme-enable "dark"))
  ;; tabbar background color doesn't seem to update
  ;; unless we do something to trigger a redraw.
  (switch-to-buffer "*scratch*")
  (run-with-timer 0.001 nil #'(lambda () (switch-to-buffer nil))))

(ots-theme-enable ots-theme-default)
(global-set-key (kbd "<S-f11>") 'ots-theme-toggle)

;; Disable italics as most monospace fonts don't
;; really have proper italics.
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :slant 'normal)

;; For font used on Unix, see ~/.Xresources.
(when (eq system-type 'windows-nt)
  (set-frame-font "Meslo LG L-10"))

(provide 'ots-theme)
;;; ots-theme.el ends here
