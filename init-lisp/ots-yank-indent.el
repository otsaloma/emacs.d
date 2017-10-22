;;; -*- coding: utf-8-unix -*-
;;; ots-yank-indent.el

(defvar ots-yank-indent-max-chars 5000
  "Number of characters over which indentation is not done.")

(defvar ots-yank-indent-modes
  '(c-mode c++-mode emacs-lisp-mode ess-mode graphql-mode html-mode java-mode
    js-mode json-mode nxml-mode octave-mode ots-qml-mode perl-mode rust-mode
    sh-mode)
  "Modes in which to indent after yanking.")

(defun ots-yank-indent-indent (beginning end)
  "Indent yanked text, as long as the region isn't too large."
  (if (<= (- end beginning) ots-yank-indent-max-chars)
      (indent-region beginning end nil)))

(defadvice yank (after yank-indent activate)
  "Indent yanked text or with prefix argument don't indent."
  (if (and (not (ad-get-arg 0))
           (member major-mode ots-yank-indent-modes))
      (let ((transient-mark-mode nil))
        (ots-yank-indent-indent (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "Indent yanked text or with prefix argument don't indent."
  (if (and (not (ad-get-arg 0))
           (member major-mode ots-yank-indent-modes))
      (let ((transient-mark-mode nil))
        (ots-yank-indent-indent (region-beginning) (region-end)))))

(provide 'ots-yank-indent)
;;; ots-yank-indent.el ends here
