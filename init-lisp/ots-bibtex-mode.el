;;; -*- coding: utf-8 -*-
;;; ots-bibtex-mode.el

(defun ots-bibtex-mode-set-properties ()
  "Set properties for editing BibTeX files."
  (modify-syntax-entry ?_ "w")
  (setq-local company-backends '((company-dabbrev)))
  (setq-local fill-column 72)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2)
  (setq-local truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'bibtex-mode-hook 'ots-bibtex-mode-set-properties)

(provide 'ots-bibtex-mode)
;;; ots-bibtex-mode.el ends here
