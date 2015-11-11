;;; -*- coding: utf-8 -*-
;;; ots-css-mode.el

(defun ots-css-mode-set-imenu ()
  "Set imenu index patterns for CSS files."
  (setq imenu-generic-expression
        '((nil "^\\([^ @\n].*\\) +{" 1)))
  (setq imenu-create-index-function
        'imenu-default-create-index-function))

(defun ots-css-mode-set-properties ()
  "Set properties for editing CSS files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (hs-minor-mode 1)
  (setq css-indent-offset 2)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("CSS"))
  (turn-on-auto-fill))

(add-hook 'css-mode-hook 'ots-css-mode-set-imenu)
(add-hook 'css-mode-hook 'ots-css-mode-set-properties)

(provide 'ots-css-mode)
;;; ots-css-mode.el ends here
