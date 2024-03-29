;;; -*- coding: utf-8 -*-
;;; ots-emacs-lisp.el

(defun ots-emacs-lisp-set-properties ()
  "Set properties for editing Emacs Lisp files."
  (setq-local dash-docs-docsets '("Emacs-Lisp"))
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2))

(use-package elisp-mode
  :defer t
  :config
  (add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-set-properties))

(provide 'ots-emacs-lisp)
;;; ots-emacs-lisp.el ends here
