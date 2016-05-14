;;; -*- coding: utf-8 -*-
;;; ots-perl-mode.el

(defun ots-perl-mode-set-properties ()
  "Set properties for editing Perl files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (hs-minor-mode 1)
  (setq-local company-backends
   '((company-keywords :with company-dabbrev)))
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'perl-mode-hook 'ots-perl-mode-set-properties)

(provide 'ots-perl-mode)
;;; ots-perl-mode.el ends here
