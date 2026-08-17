;;; -*- coding: utf-8 -*-
;;; ots-server.el

(defvar ots-server-goto-line nil
  "Non-nil if the client gave a line to jump to.")

(defun ots-server-note-goto-line (line-col)
  "Note from LINE-COL whether the client gave a line to jump to."
  (setq ots-server-goto-line (and line-col t)))

(defun ots-server-show-position ()
  "Center and flash the line the client was told to visit."
  (when (and buffer-file-name ots-server-goto-line)
    (recenter)
    (require 'pulse)
    (let ((pulse-delay 0.05)
          (pulse-iterations 30))
      (pulse-momentary-highlight-one-line)))
  (setq ots-server-goto-line nil))

(defun ots-server-show-startup-position ()
  "Center and flash the line given as a +LINE argument at startup."
  (setq ots-server-goto-line (and
    (seq-find (lambda (x) (string-match-p "\\`\\+[0-9]+" x)) command-line-args) t))
  (ots-server-show-position))

(use-package server
  :config
  (setq server-raise-frame nil)

  ;; Make it obvious where we jumped to with a +LINE argument,
  ;; especially when the file was already open in another position.
  (advice-add 'server-goto-line-column :before 'ots-server-note-goto-line)
  (add-hook 'emacs-startup-hook 'ots-server-show-startup-position t)
  (add-hook 'server-switch-hook 'ots-server-show-position t))

(provide 'ots-server)
;;; ots-server.el ends here
