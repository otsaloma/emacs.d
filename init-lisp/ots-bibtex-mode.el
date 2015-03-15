;;; -*- coding: utf-8 -*-
;;; ots-bibtex-mode.el

(defun ots-bibtex-mode-set-properties ()
  "Set properties for editing BibTeX files."
  (setq fill-column 1000)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t))

(add-hook 'bibtex-mode-hook 'ots-bibtex-mode-set-properties)

(provide 'ots-bibtex-mode)
;;; ots-bibtex-mode.el ends here
