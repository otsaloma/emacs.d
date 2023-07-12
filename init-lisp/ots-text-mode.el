;;; -*- coding: utf-8 -*-
;;; ots-text-mode.el

;; Make a distinction between actual text files (*.txt) and various
;; programming config files (any other extension) that either don't have
;; an actual mode or have a mode that inherits from text-mode. Defer
;; programming files to the corresponding functions in ots-prog-mode.

(require 'olivetti)
(require 'ots-prog-mode)

(defun ots-text-mode-set-keys ()
  "Set keybindings for editing text files."
  (if (string-match-p "\\.txt$" (or (buffer-file-name) ""))
      (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
    (ots-prog-mode-set-keys)))

(defun ots-text-mode-set-properties ()
  "Set properties for editing text files."
  (if (string-match-p "\\.txt$" (or (buffer-file-name) ""))
      (progn (setq-local company-backends '((company-capf company-dabbrev)))
             (setq-local fill-column 72)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local truncate-lines nil)
             (turn-off-auto-fill)
             (olivetti-mode 1))
    (ots-prog-mode-set-properties)))

(add-hook 'text-mode-hook 'ots-text-mode-set-keys)
(add-hook 'text-mode-hook 'ots-text-mode-set-properties)

(provide 'ots-text-mode)
;;; ots-text-mode.el ends here
