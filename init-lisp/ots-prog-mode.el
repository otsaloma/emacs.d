;;; -*- coding: utf-8 -*-
;;; ots-prog-mode.el

(defun ots-prog-mode-set-keys ()
  "Set keybindings for editing program code."
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify))

(defun ots-prog-mode-set-properties ()
  "Set properties for editing program code."
  (unwind-protect (ignore-errors (eldoc-mode 1)) (message ""))
  (unwind-protect (ignore-errors (hs-minor-mode 1)) (message ""))
  (modify-syntax-entry ?_ "w")
  (setq-local company-backends
   '((company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq-local comment-auto-fill-only-comments t)
  (setq-local fill-column 80)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'prog-mode-hook 'ots-prog-mode-set-keys)
(add-hook 'prog-mode-hook 'ots-prog-mode-set-properties)

(provide 'ots-prog-mode)
;;; ots-prog-mode.el ends here
