;;; -*- coding: utf-8 -*-
;;; ots-js-mode.el

(defun ots-js-mmm-indent-line ()
  "Indent line handling HTML in template literals correctly."
  ;; https://github.com/purcell/mmm-mode/blob/master/mmm-region.el
  (interactive)
  (let ((prev-line nil)
        (prev-level 0))
    ;; If the previous line ends in the opening backtick,
    ;; indent to one level more than that line's level.
    (save-excursion
      (forward-line -1)
      (setq prev-line (thing-at-point 'line t))
      (setq prev-level (current-indentation)))
    (if (string-match-p "`[\t ]*$" prev-line)
        (indent-line-to (+ prev-level js-indent-level))
      (mmm-indent-line)))
  (let ((current-line (thing-at-point 'line t))
        (next-level 0))
    ;; If the closing backtick is on a line of its own,
    ;; indent to the level of the following line.
    ;; XXX: This is simple, but not always correct.
    (save-excursion
      (forward-line 1)
      (setq next-level (current-indentation)))
    (if (string-match-p "^[\t ]*`" current-line)
        (indent-line-to next-level))))

(defun ots-js-mode-set-properties ()
  "Set properties for editing JavaScript files."
  (when (eq major-mode 'js-mode)
    (font-lock-add-keywords
     nil '(("\\<\\(self\\|that\\|this\\)\\>" 1 font-lock-variable-name-face))))
  (ots-util-bind-key-compile (kbd "<f8>") "jshint --reporter=unix %s")
  (ots-util-add-imenu-expressions
   '((nil "^var +\\([^ =]+\\)[ =]" 1)
     (nil "^function +\\([^(]+\\)(" 1)))
  (setq-local helm-dash-docsets '("JavaScript" "jQuery"))
  (setq-local mmm-indent-line-function 'ots-js-mmm-indent-line)
  (ots-util-add-docset "</" "HTML"))

(defun ots-js-mode-tern ()
  "Start tern-mode and its auto-complete."
  (when (eq major-mode 'js-mode)
    (tern-mode t)
    (setq-local company-backends
     '((company-tern company-keywords company-dabbrev-code)
       (company-dabbrev)))))

(add-hook 'js-mode-hook 'ots-js-mode-set-properties)
(add-hook 'js-mode-hook 'ots-js-mode-tern)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)
(setq tern-command '("tern" "--no-port-file"))

(provide 'ots-js-mode)
;;; ots-js-mode.el ends here
