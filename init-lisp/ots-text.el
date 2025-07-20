;;; -*- coding: utf-8 -*-
;;; ots-text.el

;; Make a distinction between actual text files (*.txt) and various
;; programming config files (any other extension) that either don't have
;; an actual mode or have a mode that inherits from text-mode. Defer
;; programming files to the corresponding functions in ots-prog.

(defun ots-text-set-keys ()
  "Set keybindings for editing text files."
  (if (and (buffer-file-name)
           (string-match-p "\\.txt$" (buffer-file-name)))
      (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
    (ots-prog-set-keys)))

(defun ots-text-set-properties ()
  "Set properties for editing text files."
  (if (and (buffer-file-name)
           (string-match-p "\\.txt$" (buffer-file-name)))
      (progn (setq-local company-backends '((company-capf company-dabbrev)))
             (setq-local fill-column 72)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local truncate-lines nil)
             (turn-off-auto-fill))
    (ots-prog-set-properties)))

(use-package text-mode
  :defer t
  :config
  (add-hook 'text-mode-hook 'ots-text-set-keys)
  (add-hook 'text-mode-hook 'ots-text-set-properties))

(provide 'ots-text)
;;; ots-text.el ends here
