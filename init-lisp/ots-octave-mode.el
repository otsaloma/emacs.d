;;; -*- coding: utf-8 -*-
;;; ots-octave-mode.el

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
  (local-set-key (kbd "C-h") 'query-replace-regexp)
  (local-set-key (kbd "<f6>") 'run-octave)
  (local-set-key (kbd "<f8>") 'octave-send-buffer)
  (local-set-key (kbd "<f9>") 'octave-send-line))

(defun ots-octave-mode-set-properties ()
  "Set properties for editing Octave files."
  (require 'company-dict)
  (setq-local comment-add 0)
  (setq-local comment-start "%")
  (setq-local company-backends
   '((company-dict company-dabbrev-code)
     (company-dabbrev)))
  (setq-local inferior-octave-buffer "*Octave*")
  (setq-local inferior-octave-startup-args '("--quiet" "--traditional"))
  (setq-local octave-block-offset 4)
  (setq-local octave-comment-char ?%)
  (setq-local helm-dash-docsets '("Octave")))

(add-hook 'octave-mode-hook 'ots-octave-mode-set-indentation)
(add-hook 'octave-mode-hook 'ots-octave-mode-set-keys)
(add-hook 'octave-mode-hook 'ots-octave-mode-set-properties)
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(provide 'ots-octave-mode)
;;; ots-octave-mode.el ends here
