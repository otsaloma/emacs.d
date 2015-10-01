;;; -*- coding: utf-8 -*-
;;; ots-html-mode.el

(require 'ots-theme)

(defun ots-html-mode-set-faces ()
  "Set faces for editing HTML files."
  (font-lock-add-keywords
   nil
   '(;; Attribute names
     ("\\<\\([a-z-]+\\)=\""
      1 font-lock-preprocessor-face)
     ("<script>\\(\\(.\\|\n\\)+?\\)</script>"
      1 font-lock-constant-face)
     ))
  (set-face-attribute 'bold nil :weight 'normal :underline nil)
  (set-face-attribute 'underline nil :weight 'normal :underline nil))

(defun ots-html-mode-set-properties ()
  "Set properties for editing HTML files."
  (local-set-key (kbd "C-<") 'sgml-tag)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f8>") 'browse-url-of-file)
  (setq fill-column 100)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("HTML")))

(add-hook 'html-mode-hook 'ots-html-mode-set-faces)
(add-hook 'html-mode-hook 'ots-html-mode-set-properties)

(provide 'ots-html-mode)
;;; ots-html-mode.el ends here
