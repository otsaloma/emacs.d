;;; -*- coding: utf-8 -*-
;;; ots-text-mode.el

(defun ots-text-mode-set-properties ()
  "Set properties for editing text files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq-local company-backends '((company-dabbrev)))
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'text-mode-hook 'ots-text-mode-set-properties)
(add-hook 'todoo-mode-hook '(lambda() (text-mode)))

(provide 'ots-text-mode)
;;; ots-text-mode.el ends here
