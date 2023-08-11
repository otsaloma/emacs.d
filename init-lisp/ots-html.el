;;; -*- coding: utf-8 -*-
;;; ots-html.el

(defun ots-html-set-docsets ()
  "Load dash docsets based on buffer contents."
  (ots-util-add-docset "." "HTML")
  (ots-util-add-docset "<style\\>" "CSS")
  (ots-util-add-docset "<script\\>" "JavaScript"))

(defun ots-html-set-properties ()
  "Set properties for editing HTML files."
  (add-hook 'after-save-hook 'ots-html-set-docsets t t)
  (local-set-key (kbd "C-<") 'sgml-tag)
  (local-set-key (kbd "<f9>") 'browse-url-of-file)
  (set-face-attribute 'underline nil :underline nil)
  (setq-local fill-column 120)
  (setq-local tab-width 2))

(use-package mhtml-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'html-mode-hook 'ots-html-set-docsets t)
  (add-hook 'html-mode-hook 'ots-html-set-properties))

(provide 'ots-html)
;;; ots-html.el ends here
