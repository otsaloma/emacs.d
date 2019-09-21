;;; -*- coding: utf-8 -*-
;;; ots-mode-line.el

(defun ots-mode-line-buffer-name (n)
  "Return the name of the current buffer clipped to max n characters."
  (let ((name (or buffer-file-name "")))
    (setq name (file-name-nondirectory name))
    (substring name 0 (min n (string-width name)))))

(defun ots-mode-line-character-count ()
  "Return the amount of characters on the current line."
  (number-to-string (- (line-end-position) (line-beginning-position))))

(defun ots-mode-line-editorconfig-suffix ()
  "Return a string indicating if an editorconfig file is in use."
  (if (and (boundp 'editorconfig-properties-hash)
           (gethash 'indent_size editorconfig-properties-hash)) "-EC" ""))

(defun ots-mode-line-indentation ()
  "Return a string describing current buffer's indentation settings."
  ;; tab-width is not what individual modes actually use for indentation,
  ;; but it is set by both our own config and editorconfig.
  (let ((mode (if indent-tabs-mode "T" "S"))
        (ec (ots-mode-line-editorconfig-suffix)))
    (format "%s%d%s" mode tab-width ec)))

(defun ots-mode-line-line-count ()
  "Return the amount of lines in the buffer."
  (number-to-string (count-lines (point-min) (point-max))))

(defun ots-mode-line-position ()
  "Return the current line position in buffer as percentage of total lines."
  (let ((current (line-number-at-pos))
        (total (line-number-at-pos (point-max))))
    (format "(%.0f%%%%)" (/ (* 100.0 (- current 1)) total))))

(setq-default mode-line-format
 '(" %*"    (:eval (ots-mode-line-buffer-name 40))
   " + "    (:eval (symbol-name buffer-file-coding-system))
   " + "    (:eval (symbol-name major-mode))
            (:eval (if (getenv "VIRTUAL_ENV") " (venv)" ""))
   " + "    (:eval (ots-mode-line-indentation))
   " + %l/" (:eval (ots-mode-line-line-count))
   " "      (:eval (ots-mode-line-position))
   " + %c/" (:eval (ots-mode-line-character-count))))

(provide 'ots-mode-line)
;;; ots-mode-line.el ends here
