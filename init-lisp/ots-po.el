;;; -*- coding: utf-8 -*-
;;; ots-po.el

(defun ots-po-guess-language ()
  "Return the language of the current PO file."
  (save-excursion
    (goto-char (point-min))
    (re-search-forward po-any-msgstr-block-regexp)
    (goto-char (match-beginning 0))
    (if (re-search-forward
         "\n\"Language: +\\(.+\\)\\\\n\"$"
         (match-end 0) t)
        (po-match-string 1))))

(defun ots-po-set-properties ()
  "Set properties for editing PO files."
  ;; XXX: Why do we need these here?
  (display-line-numbers-mode 1)
  (font-lock-mode)
  (local-set-key (kbd "C-s") 'ots-util-save-buffer)
  (local-set-key (kbd "C-z") 'po-undo))

(defun ots-po-subedit-set-properties ()
  "Set properties for editing PO file entries."
  (turn-off-auto-fill)
  (visual-line-mode 1)
  (define-key po-subedit-mode-map (kbd "C-s") 'po-subedit-exit)
  (define-key po-subedit-mode-map (kbd "C-g") 'po-subedit-abort)
  (setq-local po-subedit-message "Type 'C-s' to save, or 'C-g' to abort edit"))

(use-package po-mode
  :mode "\\.pot?\\'"
  :config
  (add-hook 'po-mode-hook 'ots-po-set-properties)
  (add-hook 'po-subedit-mode-hook 'ots-po-subedit-set-properties))

(provide 'ots-po)
;;; ots-po.el ends here
