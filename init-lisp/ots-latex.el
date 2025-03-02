;;; -*- coding: utf-8 -*-
;;; ots-latex.el

(defun ots-latex-set-properties ()
  "Set properties for editing LaTeX files."
  (company-auctex-init)
  (display-line-numbers-mode 1)
  (setq-local comment-auto-fill-only-comments nil)
  (setq-local dash-docs-docsets '("LaTeX"))
  (setq-local LaTeX-indent-level 0)
  (setq-local LaTeX-item-indent 0)
  (setq-local reftex-plug-into-AUCTeX t)
  (setq-local tab-width 2)
  (setq-local TeX-electric-sub-and-superscript t)
  (turn-on-reftex))

(use-package latex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (add-hook 'LaTeX-mode-hook 'ots-latex-set-properties))

(provide 'ots-latex)
;;; ots-latex.el ends here
