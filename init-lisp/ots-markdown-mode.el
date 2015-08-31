;;; -*- coding: utf-8 -*-
;;; ots-markdown-mode.el

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defvar ots-markdown-mode-css-file
  (concat "file://"
    (expand-file-name "~/.local/share/markdown/github.css"))
  "Name of stylesheet file to use.")

(defun ots-markdown-mode-browse ()
  "Browse file:// URL of the current buffer."
  (interactive)
  (browse-url (file-name-nondirectory (buffer-file-name))))

(defun ots-markdown-mode-set-faces ()
  "Set faces for editing markdown files."
  (set-face-attribute 'markdown-bold-face nil :weight 'normal)
  (let ((face 'font-lock-negation-char-face))
    (set-face-attribute 'markdown-header-delimiter-face nil :inherit face)
    (set-face-attribute 'markdown-header-face nil :inherit face)
    (set-face-attribute 'markdown-header-rule-face nil :inherit face)))

(defun ots-markdown-mode-set-properties ()
  "Set properties for editing markdown files."
  (local-set-key (kbd "<f8>") 'ots-markdown-mode-browse)
  (local-set-key (kbd "<S-f8>") 'markdown-preview)
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq markdown-command (format "pandoc --css=%s" ots-markdown-mode-css-file))
  (setq markdown-indent-function 'indent-relative-maybe)
  (setq markdown-indent-on-enter nil)
  (setq tab-width 4)
  (setq truncate-lines t)
  (turn-on-auto-fill)
  ;; Use GitHub Flavored Markdown by default.
  ;; http://help.github.com/articles/github-flavored-markdown/
  ;; This also works around some auto-indentation bug.
  (if (not (eq major-mode 'gfm-mode))
      (gfm-mode)))

(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-faces)
(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-properties)

(provide 'ots-markdown-mode)
;;; ots-markdown-mode.el ends here
