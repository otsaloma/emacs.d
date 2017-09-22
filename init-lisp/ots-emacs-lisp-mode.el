;;; -*- coding: utf-8 -*-
;;; ots-emacs-lisp-mode.el

(defun ots-emacs-lisp-mode-set-keys ()
  "Set keybindings for editing Emacs Lisp files."
  (local-set-key (kbd "<f5>") 'emacs-lisp-byte-compile)
  (local-set-key (kbd "<f6>") 'ielm))

(defun ots-emacs-lisp-mode-set-properties ()
  "Set properties for editing Emacs Lisp files."
  (setq-local company-backends
   '((company-elisp company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq-local helm-dash-docsets '("Emacs-Lisp"))
  (setq-local tab-width 2))

(add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-mode-set-keys)
(add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-mode-set-properties)
(modify-coding-system-alist 'file "\\.el\\'" 'utf-8)

(provide 'ots-emacs-lisp-mode)
;;; ots-emacs-lisp-mode.el ends here
