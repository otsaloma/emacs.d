;;; -*- coding: utf-8-unix -*-
;;; ots-yank-indent.el

(defvar ots-yank-indent-max-chars 5000
  "Number of characters over which indentation is not done.")

(defvar ots-yank-indent-modes
  '(c-mode c++-mode emacs-lisp-mode ess-r-mode graphql-mode html-mode java-mode
    js-json-mode js-mode nxml-mode perl-mode rust-mode sh-mode)
  "Modes in which to indent after yanking.")

(defun ots-yank-indent-advice (&optional arg &rest _)
  "Indent yanked text, unless prefix ARG given or mode unsupported."
  (if (and (not arg)
           (member major-mode ots-yank-indent-modes))
      (let ((transient-mark-mode nil))
        (ots-yank-indent-indent (region-beginning) (region-end)))))

(defun ots-yank-indent-indent (beginning end)
  "Indent yanked text, as long as the region isn't too large."
  (if (<= (- end beginning) ots-yank-indent-max-chars)
      (indent-region beginning end nil)))

(advice-add 'yank :after #'ots-yank-indent-advice)
(advice-add 'yank-pop :after #'ots-yank-indent-advice)

(provide 'ots-yank-indent)
;;; ots-yank-indent.el ends here
