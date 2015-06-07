;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(let ((modes '(("\\.\\(geo\\|topo\\)?json$" . js-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-js-mode-set-faces ()
  "Set faces for editing JavaScript files."
  (font-lock-add-keywords
   nil
   '(;; Constants
     ("\\<\\(self\\|that\\)\\>"
      1 font-lock-constant-face)
     )))

(defun ots-js-mode-set-properties ()
  "Set properties for editing JavaScript files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery")))

(add-hook 'js-mode-hook 'ots-js-mode-set-faces)
(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
