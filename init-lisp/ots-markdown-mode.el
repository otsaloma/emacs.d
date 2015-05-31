;;; -*- coding: utf-8 -*-
;;; ots-markdown-mode.el

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defvar ots-markdown-mode-css-file
  (expand-file-name "~/.local/share/markdown/github.css")
  "Name of stylesheet file to use.")

(defun ots-markdown-mode-set-faces ()
  "Set faces for editing markdown files."
  (set-face-attribute 'markdown-bold-face nil :weight 'normal)
  (set-face-attribute 'markdown-header-delimiter-face nil :weight 'normal)
  (set-face-attribute 'markdown-header-face nil :weight 'normal)
  (set-face-attribute 'markdown-header-rule-face nil :weight 'normal))

(defun ots-markdown-mode-set-properties ()
  "Set properties for editing markdown files."
  (local-set-key (kbd "<f8>") 'markdown-preview)
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq markdown-command (format "pandoc --css=%s" ots-markdown-mode-css-file))
  (setq markdown-indent-function 'indent-relative-maybe)
  (setq markdown-indent-on-enter nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill)
  ;; Work around some indentation bug in markdown-mode.
  (add-hook 'first-change-hook '(lambda()
    (when (derived-mode-p 'markdown-mode)
      (markdown-mode)))))

(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-faces)
(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-properties)

(provide 'ots-markdown-mode)
;;; ots-markdown-mode.el ends here
