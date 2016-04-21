;;; -*- coding: utf-8 -*-
;;; ots-csv-mode.el

(defun ots-csv-mode-is-csv (separator)
  "Return true if the current buffer looks like a CSV file."
  (with-current-buffer (current-buffer)
    (save-excursion
      (let (count count-header (csv t))
        (goto-char (point-min))
        (while (not (eobp))
          (setq count (how-many separator (point) (point-at-eol)))
          (if (not count-header)
              (setq count-header count))
          ;; If separator found and amount matches that of
          ;; the header line, continue to the next line.
          ;; Terminate once a no-match found or a sufficient
          ;; amount of lines examined.
          (setq csv (and (> count 0) (= count count-header)))
          (if (and csv (< (line-number-at-pos) 100))
              (forward-line)
            (goto-char (point-max))))
        csv))))

(defun ots-csv-mode-set-faces ()
  "Set faces for editing CSV files."
  (font-lock-add-keywords
   nil '(("\\`.*$" . font-lock-function-name-face))))

(defun ots-csv-mode-set-properties ()
  "Set properties for editing CSV files."
  (setq csv-align-padding 2)
  (setq csv-align-style 'right)
  (setq csv-separators '(";" "\t"))
  (setq whitespace-style nil)
  (csv-align-fields nil (point-min) (point-max)))

(defun ots-csv-mode-txt-maybe ()
  "Enable csv-mode for tab-delimited text files."
  (when (and (eq major-mode 'text-mode)
             (buffer-file-name)
             (string-match "\\.txt$" (buffer-file-name))
             (ots-csv-mode-is-csv "\t"))
    (setq csv-separators '("\t"))
    (require 'csv-mode)
    (csv-mode)))

(add-hook 'csv-mode-hook  'ots-csv-mode-set-faces)
(add-hook 'csv-mode-hook  'ots-csv-mode-set-properties)
(add-hook 'text-mode-hook 'ots-csv-mode-txt-maybe)

(provide 'ots-csv-mode)
;;; ots-csv-mode.el ends here
