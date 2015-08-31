;;; -*- coding: utf-8 -*-
;;; ots-moinmoin-mode.el

(autoload 'ots-moinmoin-mode "moinmoin" "Edit MoinMoin wiki files." t)
(let ((modes '(("\\.\\(moinmoin\\|wiki\\)$" . ots-moinmoin-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(defun ots-moinmoin-mode ()
  "Mode for editing MoinMoin wiki files."
  (setq major-mode 'ots-moinmoin-mode mode-name "MoinMoin")
  (run-hooks 'ots-moinmoin-mode-hook))

(defun ots-moinmoin-mode-set-faces ()
  "Set faces for editing MoinMoin wiki files."
  (font-lock-add-keywords
   nil
   '(;; Titles
     ("^\\( *?=+ .+? =+ *?\\)$" 1 font-lock-negation-char-face)
     ;; Symbols
     ("\\(^ *\\* \\)" 1 font-lock-builtin-face)
     ("\\(^ *[0-9]+\\. \\)" 1 font-lock-builtin-face)
     ("\\(\{\{\{.*$\\)" 1 font-lock-builtin-face)
     ("\\(\}\}\}\\)" 1 font-lock-builtin-face)
     ;; Fields
     ("\\('''.*?'''\\)" 1 font-lock-string-face)
     ("\\(''.*?''\\)" 1 font-lock-string-face)
     ("\\(`.*?`\\)" 1 font-lock-type-face)
     ("\\(<<.*?>>\\)" 1 font-lock-keyword-face)
     ("\\(\\[\\[.*?\\]\\]\\)" 1 font-lock-keyword-face)
     )))

(defun ots-moinmoin-mode-set-properties ()
  "Set properties for editing MoinMoin wiki files."
  (local-set-key (kbd "<backspace>") 'backward-delete-char-untabify)
  (setq truncate-lines t)
  (turn-off-auto-fill)
  (visual-line-mode 1))

(add-hook 'ots-moinmoin-mode-hook 'ots-moinmoin-mode-set-faces)
(add-hook 'ots-moinmoin-mode-hook 'ots-moinmoin-mode-set-properties)

(provide 'ots-moinmoin-mode)
;;; ots-moinmoin-mode.el ends here
