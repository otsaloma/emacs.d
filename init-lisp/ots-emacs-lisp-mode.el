;;; -*- coding: utf-8 -*-
;;; ots-emacs-lisp-mode.el

(defun ots-emacs-lisp-mode-set-keys ()
  "Set keybindings for editing Emacs Lisp files."
  (local-set-key (kbd "<f9>") 'emacs-lisp-byte-compile))

(defun ots-emacs-lisp-mode-set-properties ()
  "Set properties for editing Emacs Lisp files."
  (setq-local dash-docs-docsets '("Emacs-Lisp"))
  (setq-local tab-width 2))

(add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-mode-set-keys)
(add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-mode-set-properties)
(modify-coding-system-alist 'file "\\.el\\'" 'utf-8)

(provide 'ots-emacs-lisp-mode)
;;; ots-emacs-lisp-mode.el ends here
