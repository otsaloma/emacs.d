;;; -*- coding: utf-8 -*-
;;; ots-html-mode.el

(defun ots-html-mode-set-properties ()
  "Set properties for editing HTML files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f8>") 'browse-url-of-file)
  (setq fill-column 100)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("HTML")))

(add-hook 'html-mode-hook 'ots-html-mode-set-properties)

(provide 'ots-html-mode)
;;; ots-html-mode.el ends here
