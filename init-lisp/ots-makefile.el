;;; -*- coding: utf-8 -*-
;;; ots-makefile.el

(defun ots-makefile-set-faces ()
  "Set faces for editing Makefiles."
  (font-lock-add-keywords
   nil '(("\\<\\(do\\|done\\|elif\\|else\\|fi\\|for\\|if\\|in\\|while\\)\\>" 1 font-lock-keyword-face)
         ("\$\$\\([a-zA-Z_]*\\)" 1 font-lock-preprocessor-face))))

(defun ots-makefile-set-properties ()
  "Set properties for editing Makefiles."
  (setq-local dash-docs-docsets '("Make"))
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local whitespace-style (quote (face tabs tab-mark))))

(add-hook 'makefile-mode-hook 'ots-makefile-set-faces)
(add-hook 'makefile-mode-hook 'ots-makefile-set-properties)
(modify-coding-system-alist 'file "Makefile\\'" 'utf-8)

(provide 'ots-makefile)
;;; ots-makefile.el ends here
