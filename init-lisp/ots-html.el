;;; -*- coding: utf-8 -*-
;;; ots-html.el

(defun ots-html-set-docsets ()
  "Load helm-dash docsets based on buffer contents."
  (setq-local dash-docs-docsets '("HTML"))
  (ots-util-add-docset "<style\\>" "CSS")
  (ots-util-add-docset "<script\\>" "JavaScript"))

(defun ots-html-set-faces ()
  "Set faces for editing HTML files."
  (font-lock-add-keywords
   nil '(("\\<\\([a-z-]+\\)=\"" 1 font-lock-preprocessor-face)))
  (set-face-attribute 'underline nil :underline nil))

(defun ots-html-set-properties ()
  "Set properties for editing HTML files."
  (local-set-key (kbd "C-<") 'sgml-tag)
  (local-set-key (kbd "<f9>") 'browse-url-of-file)
  (setq-local fill-column 100)
  (setq-local tab-width 2))

(add-hook 'after-save-hook 'ots-html-set-docsets t)
(add-hook 'html-mode-hook 'ots-html-set-docsets t)
(add-hook 'html-mode-hook 'ots-html-set-faces)
(add-hook 'html-mode-hook 'ots-html-set-properties)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . mhtml-mode))
(modify-coding-system-alist 'file "\\.html\\'" 'utf-8)

(provide 'ots-html)
;;; ots-html.el ends here
