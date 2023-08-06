;;; -*- coding: utf-8 -*-
;;; ots-bibtex.el

(defun ots-bibtex-set-properties ()
  "Set properties for editing BibTeX files."
  (modify-syntax-entry ?_ "w")
  (setq-local fill-column 72)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2)
  (setq-local truncate-lines t)
  (turn-on-auto-fill))

(add-hook 'bibtex-mode-hook 'ots-bibtex-set-properties)

(provide 'ots-bibtex)
;;; ots-bibtex.el ends here
