;;; -*- coding: utf-8 -*-
;;; ots-mode-line.el

(defun ots-mode-line-buffer-name (max)
  "Return name of the current buffer clipped to max characters."
  (let ((buffer-name buffer-file-name))
    (if (not buffer-name)
        (setq buffer-name ""))
    (setq buffer-name (file-name-nondirectory buffer-name))
    (if (> (length buffer-name) max)
        (setq buffer-name (substring buffer-name 0 max)))
    buffer-name))

(defun ots-mode-line-character-count ()
  "Return amount of characters on the current line."
  (number-to-string (- (line-end-position) (line-beginning-position))))

(defun ots-mode-line-indentation ()
  "Return a string describing current buffer's indentation settings."
  (if indent-tabs-mode
      (format "T%d" tab-width)
    (format "S%d" tab-width)))

(defun ots-mode-line-line-count ()
  "Return amount of lines in the buffer."
  (number-to-string (count-lines (point-min) (point-max))))

(defun ots-mode-line-position ()
  "Return current line position in buffer as percentage of total lines."
  (let ((current (line-number-at-pos))
        (total (count-lines (point-min) (point-max))))
    (format "(%.0f%%%%)" (/ (* 100.0 (- current 1)) total))))

(setq default-mode-line-format
      '(" %*"    (:eval (ots-mode-line-buffer-name 40))
        " • "    (:eval (symbol-name buffer-file-coding-system))
        " • "    (:eval (symbol-name major-mode))
        " • "    (:eval (ots-mode-line-indentation))
        " • %l/" (:eval (ots-mode-line-line-count))
        " "      (:eval (ots-mode-line-position))
        " • %c/" (:eval (ots-mode-line-character-count))))

(provide 'ots-mode-line)
;;; ots-mode-line.el ends here
