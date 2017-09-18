;;; -*- coding: utf-8 -*-
;;; ots-markdown-mode.el

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(defvar ots-markdown-mode-css-file
  (expand-file-name "~/.local/share/markdown-css/github.css")
  "Name of stylesheet file to use.")

(defvar ots-markdown-mode-command
  (concat "pandoc"
          " --from=markdown"
          " --to=html5"
          " --ascii"
          " --css=" (convert-standard-filename ots-markdown-mode-css-file)
          " --highlight-style=haddock"
          " --self-contained"
          " --smart")
  "Command to use to compile Markdown files.")

(defun ots-markdown-mode-set-faces ()
  "Set faces for editing markdown files."
  (font-lock-add-keywords
   nil '(("</?\\([^ ][^!>\n]*\\)>" 1 font-lock-keyword-face))))

(defun ots-markdown-mode-set-properties ()
  "Set properties for editing markdown files."
  (local-set-key (kbd "<f8>") 'markdown-preview)
  (local-set-key (kbd "<f9>") 'markdown-export)
  (setq fill-column 72)
  (setq indent-tabs-mode nil)
  (setq markdown-command ots-markdown-mode-command)
  (setq markdown-command-needs-filename t)
  (setq markdown-fontify-code-blocks-natively t)
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
(modify-coding-system-alist 'file "\\.md\\'" 'utf-8)

(provide 'ots-markdown-mode)
;;; ots-markdown-mode.el ends here
