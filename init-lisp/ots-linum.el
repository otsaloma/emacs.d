;;; -*- coding: utf-8 -*-
;;; ots-linum.el

(require 'linum)

(defvar ots-linum-width 3)
(make-variable-buffer-local 'ots-linum-width)

(defun ots-linum-enable ()
  "Turn linum-mode on if in a normal buffer."
  ;; linum is unbearably slow in large buffers.
  (when (< (count-lines (point-min) (point-max)) 10000)
    (catch 'found
      (dolist (mode ots-normal-modes)
        (when (derived-mode-p mode)
          (linum-mode 1)
          (throw 'found t))))))

(defun ots-linum-format (line)
  "Return line number string to show in line number area."
  (propertize (format (format " %%%dd " ots-linum-width) line) 'face 'linum))

(defun ots-linum-update-width ()
  "Update margin width needed to display line numbers."
  (let ((n (count-lines (point-min) (point-max))))
    (setq ots-linum-width (max 3 (length (number-to-string n))))))

(add-hook 'after-change-major-mode-hook 'ots-linum-enable)
(add-hook 'after-save-hook 'ots-linum-update-width)
(add-hook 'linum-mode-hook 'ots-linum-update-width)

(setq linum-delay t)
(setq linum-format 'ots-linum-format)

(provide 'ots-linum)
;;; ots-linum.el ends here
