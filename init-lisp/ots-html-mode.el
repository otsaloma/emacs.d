;;; -*- coding: utf-8 -*-
;;; ots-html-mode.el

(require 'ots-theme)

(defun ots-html-mode-set-docsets ()
  "Load helm-dash docsets based on buffer contents."
  (let ((docsets '("HTML"))
        (text (buffer-substring (point-min) (point-max))))
    (when (string-match-p "<style>" text)
      (add-to-list 'docsets "CSS"))
    (when (string-match-p "<script>" text)
      (add-to-list 'docsets "JavaScript"))
    (setq-local helm-dash-docsets docsets)))

(defun ots-html-mode-set-faces ()
  "Set faces for editing HTML files."
  (font-lock-add-keywords
   nil '(("\\<\\([a-z-]+\\)=\"" 1 font-lock-preprocessor-face)
         ("<script>\\(\\(.\\|\n\\)+?\\)</script>" 1 font-lock-constant-face)))
  (set-face-attribute 'bold nil :weight 'normal :underline nil)
  (set-face-attribute 'underline nil :weight 'normal :underline nil))

(defun ots-html-mode-set-imenu ()
  "Set imenu index patterns for HTML files."
  (setq imenu-generic-expression
        '((nil "\\(</?\\(head\\|body\\|header\\|main\\|footer\\)>\\)" 1)
          (nil "\\<\\(id=\"[^\"]+\"\\)" 1)))
  (setq imenu-create-index-function
        'imenu-default-create-index-function))

(defun ots-html-mode-set-properties ()
  "Set properties for editing HTML files."
  (local-set-key (kbd "C-<") 'sgml-tag)
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f8>") 'browse-url-of-file)
  (setq fill-column 100)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t))

(add-hook 'html-mode-hook 'ots-html-mode-set-docsets t)
(add-hook 'html-mode-hook 'ots-html-mode-set-faces)
(add-hook 'html-mode-hook 'ots-html-mode-set-imenu)
(add-hook 'html-mode-hook 'ots-html-mode-set-properties)
(modify-coding-system-alist 'file "\\.html\\'" 'utf-8)

(provide 'ots-html-mode)
;;; ots-html-mode.el ends here
