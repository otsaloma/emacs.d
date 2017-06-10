;;; -*- coding: utf-8 -*-
;;; ots-octave-mode.el

(require 'company-dict)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(defun ots-octave-mode-set-indentation ()
  "Fix stupid indentation of single character comments."
  ;; https://emacs.stackexchange.com/a/15170
  (defun octave-indent-comment ()
    (save-excursion
      (back-to-indentation)
      (cond ((octave-in-string-or-comment-p) nil)
            ((looking-at-p "\\(\\s<\\)\\1\\{2,\\}") 0)))))

(defun ots-octave-mode-set-keys ()
  "Set keybindings for editing Octave files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (local-set-key (kbd "<f2>") 'helm-dash-at-point)
  (local-set-key (kbd "<f6>") 'run-octave)
  (local-set-key (kbd "<f8>") 'octave-send-buffer)
  (local-set-key (kbd "<f9>") 'octave-send-line))

(defun ots-octave-mode-set-properties ()
  "Set properties for editing Octave files."
  (eldoc-mode 1)
  (setq comment-add 0)
  (setq comment-start "%")
  (setq-local company-backends
   '((company-dict company-dabbrev-code)
     (company-dabbrev)))
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq inferior-octave-buffer "*Octave*")
  (setq inferior-octave-startup-args '("--quiet" "--traditional"))
  (setq octave-block-offset 4)
  (setq octave-comment-char ?%)
  (setq tab-width 4)
  (setq truncate-lines t)
  (setq-local helm-dash-docsets '("Octave"))
  (turn-on-auto-fill))

(add-hook 'octave-mode-hook 'ots-octave-mode-set-indentation)
(add-hook 'octave-mode-hook 'ots-octave-mode-set-keys)
(add-hook 'octave-mode-hook 'ots-octave-mode-set-properties)

(provide 'ots-octave-mode)
;;; ots-octave-mode.el ends here
