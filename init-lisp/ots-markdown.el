;;; -*- coding: utf-8 -*-
;;; ots-markdown.el

(defvar ots-markdown-command
  (format "pandoc --from=gfm --to=html5 --ascii --css=%s --highlight-style=haddock --self-contained 2> /dev/null"
          (expand-file-name "~/.local/share/markdown-css/github.css"))
  "Command to use to compile Markdown files.")

(defun ots-markdown-set-properties ()
  "Set properties for editing Markdown files."
  (local-set-key (kbd "<return>") 'markdown-enter-key)
  (local-set-key (kbd "<kp-enter>") 'markdown-enter-key)
  (local-set-key (kbd "<f9>") 'markdown-preview)
  (local-set-key (kbd "<f10>") 'markdown-export)
  (setq-local comment-auto-fill-only-comments nil)
  (setq-local fill-column 72)
  (setq-local markdown-command ots-markdown-command)
  (setq-local markdown-command-needs-filename t)
  (setq-local markdown-fontify-code-blocks-natively t)
  (setq-local markdown-gfm-use-electric-backquote nil)
  (setq-local markdown-indent-function 'indent-relative-maybe)
  (setq-local markdown-indent-on-enter nil)
  (setq-local markdown-spaces-after-code-fence 0)
  ;; ess-mode doesn't seem to work and a lacking definition
  ;; confuses syntax highlighting outside the code block.
  (add-to-list 'markdown-code-lang-modes '("r" . python-mode)))

(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode)
  :config
  (add-hook 'markdown-mode-hook 'ots-markdown-set-properties))

(provide 'ots-markdown)
;;; ots-markdown.el ends here
