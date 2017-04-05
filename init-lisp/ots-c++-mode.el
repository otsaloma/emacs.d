;;; -*- coding: utf-8 -*-
;;; ots-c++-mode.el

(defun ots-c++-mode-set-properties ()
  "Set properties for editing C files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (c-set-style "k&r")
  (hs-minor-mode 1)
  (modify-syntax-entry ?_ "w")
  (setq-local company-backends
   '((company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq c-basic-offset 4)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'c++-mode-hook 'ots-c++-mode-set-properties)

(provide 'ots-c++-mode)
;;; ots-c++-mode.el ends here
