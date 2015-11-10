;;; -*- coding: utf-8 -*-
;;; ots-emacs-lisp-mode.el

(defun ots-emacs-lisp-mode-set-properties ()
  "Set properties for editing Emacs Lisp files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f5>") 'emacs-lisp-byte-compile)
  (local-set-key (kbd "<f8>") 'ielm)
  (eldoc-mode 1)
  (hs-minor-mode 1)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("Emacs-Lisp"))
  (turn-on-auto-fill))

(add-hook 'emacs-lisp-mode-hook 'ots-emacs-lisp-mode-set-properties)

(provide 'ots-emacs-lisp-mode)
;;; ots-emacs-lisp-mode.el ends here
