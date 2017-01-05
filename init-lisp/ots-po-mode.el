;;; -*- coding: utf-8 -*-
;;; ots-po-mode.el

(defun ots-po-mode-guess-language ()
  "Return the language of the current PO file."
  (save-excursion
    (goto-char (point-min))
    (re-search-forward po-any-msgstr-block-regexp)
    (goto-char (match-beginning 0))
    (if (re-search-forward
         "\n\"Language: +\\(.+\\)\\\\n\"$"
         (match-end 0) t)
        (po-match-string 1))))

(defun ots-po-mode-set-properties ()
  "Set properties for editing PO files."
  (linum-mode 1)
  (local-set-key (kbd "C-s") 'ots-util-save-buffer)
  (local-set-key (kbd "C-z") 'po-undo))

(defun ots-po-subedit-mode-set-properties ()
  "Set properties for editing PO file entries."
  (turn-off-auto-fill)
  (visual-line-mode 1)
  (define-key po-subedit-mode-map (kbd "C-s") 'po-subedit-exit)
  (define-key po-subedit-mode-map (kbd "C-g") 'po-subedit-abort)
  (set (make-local-variable 'po-subedit-message)
       "Type 'C-s' once done, or 'C-g' to abort edit"))

(defadvice po-edit-string (around setup-spell-checking (string type expand-tabs) activate)
  "Set up spell-checking for the subedit buffer."
  (let ((lang (ots-po-mode-guess-language)))
    ad-do-it
    (when lang
      (wcheck-change-language lang)
      (wcheck-mode))))

(add-hook 'po-mode-hook 'ots-po-mode-set-properties)
(add-hook 'po-subedit-mode-hook 'ots-po-subedit-mode-set-properties)
(modify-coding-system-alist 'file "\\.po\\'" 'utf-8)

(provide 'ots-po-mode)
;;; ots-po-mode.el ends here
