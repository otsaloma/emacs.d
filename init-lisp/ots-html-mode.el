;;; -*- coding: utf-8 -*-
;;; ots-html-mode.el

(defun ots-html-mode-set-docsets ()
  "Load helm-dash docsets based on buffer contents."
  (setq-local helm-dash-docsets '("HTML"))
  (ots-util-add-docset "<style\\>" "CSS")
  (ots-util-add-docset "<script\\>" "JavaScript"))

(defun ots-html-mode-set-faces ()
  "Set faces for editing HTML files."
  (font-lock-add-keywords
   nil '(("\\<\\([a-z-]+\\)=\"" 1 font-lock-preprocessor-face)))
  (set-face-attribute 'underline nil :underline nil))

(defun ots-html-mode-set-properties ()
  "Set properties for editing HTML files."
  (local-set-key (kbd "C-<") 'sgml-tag)
  (local-set-key (kbd "<f9>") 'browse-url-of-file)
  (setq-local fill-column 100)
  (setq-local tab-width 2))

(add-hook 'html-mode-hook 'ots-html-mode-set-docsets t)
(add-hook 'html-mode-hook 'ots-html-mode-set-faces)
(add-hook 'html-mode-hook 'ots-html-mode-set-properties)
(modify-coding-system-alist 'file "\\.html\\'" 'utf-8)

(provide 'ots-html-mode)
;;; ots-html-mode.el ends here
