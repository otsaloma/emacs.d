;;; -*- coding: utf-8 -*-
;;; ots-markdown-mode.el

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
  "Set faces for editing Markdown files."
  (font-lock-add-keywords
   nil '(("</?\\([^ ][^!>\n]*\\)>" 1 font-lock-keyword-face))))

(defun ots-markdown-mode-set-properties ()
  "Set properties for editing Markdown files."
  (local-set-key (kbd "<return>") 'markdown-enter-key)
  (local-set-key (kbd "<kp-enter>") 'markdown-enter-key)
  (local-set-key (kbd "<f8>") 'markdown-preview)
  (local-set-key (kbd "<f9>") 'markdown-export)
  ;; XXX: ess-mode doesn't seem to work and a lacking definition
  ;; confuses syntax highlighting outside the code block.
  (add-to-list 'markdown-code-lang-modes '("r" . python-mode))
  (setq-local comment-auto-fill-only-comments nil)
  (setq-local fill-column 72)
  (setq-local markdown-command ots-markdown-mode-command)
  (setq-local markdown-command-needs-filename t)
  (setq-local markdown-fontify-code-blocks-natively t)
  (setq-local markdown-gfm-use-electric-backquote nil)
  (setq-local markdown-indent-function 'indent-relative-maybe)
  (setq-local markdown-indent-on-enter nil)
  (setq-local markdown-spaces-after-code-fence 0)
  ;; Use GitHub Flavored Markdown by default.
  (if (not (eq major-mode 'gfm-mode))
      (gfm-mode)))

(autoload 'markdown-mode "markdown-mode" "Markdown" t)
(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-faces)
(add-hook 'markdown-mode-hook 'ots-markdown-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(modify-coding-system-alist 'file "\\.md\\'" 'utf-8)

(provide 'ots-markdown-mode)
;;; ots-markdown-mode.el ends here
