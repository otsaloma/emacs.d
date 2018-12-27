;;; -*- coding: utf-8 -*-
;;; ots-text-mode.el

(defun ots-text-mode-set-keys ()
  "Set keybindings for editing text files."
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify))

(defun ots-text-mode-set-properties ()
  "Set properties for editing text files."
  (unwind-protect (ignore-errors (eldoc-mode 1)) (message ""))
  (unwind-protect (ignore-errors (hs-minor-mode 1)) (message ""))
  (modify-syntax-entry ?_ "w")
  (setq-local company-backends
   '((company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq-local comment-auto-fill-only-comments t)
  (setq-local fill-column 72)
  (setq-local indent-tabs-mode nil)
  ;; Restore normal mode-independent paragraph navigation.
  (setq-local paragraph-separate "[ \t\f]*$")
  (setq-local paragraph-start "\f\\|[ \t]*$")
  (setq-local tab-width 4)
  (setq-local truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'text-mode-hook 'ots-text-mode-set-keys)
(add-hook 'text-mode-hook 'ots-text-mode-set-properties)

(provide 'ots-text-mode)
;;; ots-text-mode.el ends here
