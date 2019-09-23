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

;; Set line spacing depending on font used.
(let ((family (face-attribute 'default :family)))
  (setq-default line-spacing
                (cond ((string= family "Cascadia Code") 0.40)
                      ((string= family "IBM Plex Mono") 0.30)
                      ((string= family "Meslo LG L") 0.15)
                      ((string= family "SF Mono") 0.50))))

;; Disable italics as most monospace fonts don't really have proper italics.
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :slant 'normal)

;; Force a sensible fallback for the missing ranges of Cascadia.
;; https://github.com/microsoft/cascadia-code/issues/33
(if (string-match-p "Cascadia Code" (face-font 'default))
    (set-fontset-font "fontset-startup" '(#x00a0 . #xffff) "SF Mono"))

(provide 'ots-theme)
;;; ots-theme.el ends here
