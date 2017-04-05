;;; -*- coding: utf-8 -*-
;;; ots-java-mode.el

(defun ots-java-mode-set-properties ()
  "Set properties for editing Java files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (c-set-style "k&r")
  (hs-minor-mode 1)
  (setq-local company-backends
   '((company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq c-basic-offset 4)
  (setq fill-column 80)
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'java-mode-hook 'ots-java-mode-set-properties)

(provide 'ots-java-mode)
;;; ots-java-mode.el ends here
