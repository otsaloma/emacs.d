;;; -*- coding: utf-8 -*-
;;; ots-makefile.el

(defun ots-makefile-set-properties ()
  "Set properties for editing Makefiles."
  (font-lock-add-keywords nil
   '(("\\<\\(case\\|do\\|done\\|echo\\|elif\\|else\\|esac\\|fi\\|for\\|if\\|in\\|printf\\|then\\|until\\|while\\)\\>" 1 font-lock-keyword-face)
     ("\\(&&\\|||\\)" 1 font-lock-keyword-face)))
  (setq-local dash-docs-docsets '("Make"))
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local whitespace-style (quote (face tabs tab-mark))))

(use-package make-mode
  :defer t
  :config
  (add-hook 'makefile-mode-hook 'ots-makefile-set-properties))

(provide 'ots-makefile)
;;; ots-makefile.el ends here
