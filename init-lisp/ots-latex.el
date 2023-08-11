;;; -*- coding: utf-8 -*-
;;; ots-latex.el

(defun ots-latex-set-face-sectioning (level)
  "Set fonts and colors for section titles."
  (let ((face (format "font-latex-sectioning-%d-face" level)))
    (setq face (car (read-from-string face)))
    (set-face-attribute face nil :background nil)
    (set-face-attribute face nil :foreground nil)
    (set-face-attribute face nil :inherit 'font-lock-negation-char-face)))

(defun ots-latex-set-faces ()
  "Set fonts and colors for editing LaTeX files."
  (font-latex-add-keywords '(("frametitle" "[{")) 'slide-title)
  (ots-latex-set-faces-sectioning)
  (ots-latex-set-faces-verbatim))

(defun ots-latex-set-faces-sectioning ()
  "Set fonts and colors for section titles."
  (dotimes (i 6) (ots-latex-set-face-sectioning i))
  (let ((face 'font-latex-slide-title-face))
    (set-face-attribute face nil :background nil)
    (set-face-attribute face nil :foreground nil)
    (set-face-attribute face nil :inherit 'font-lock-negation-char-face)))

(defun ots-latex-set-faces-verbatim ()
  "Set fonts and colors for verbatim text."
  (make-local-variable 'LaTeX-verbatim-regexp)
  (setq LaTeX-verbatim-regexp (concat LaTeX-verbatim-regexp "\\|Verbatim"))
  (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
  (font-latex-set-syntactic-keywords))

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
  (add-hook 'LaTeX-mode-hook 'ots-latex-set-faces)
  (add-hook 'LaTeX-mode-hook 'ots-latex-set-properties))

(provide 'ots-latex)
;;; ots-latex.el ends here
