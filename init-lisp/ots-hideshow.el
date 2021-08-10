;;; -*- coding: utf-8 -*-
;;; ots-hideshow.el

(defface hs-overlay-face
  '((t (:background "#f0f080" :foreground "#2e3436" :box "#bdbd65")))
  "Face to use for hideshow code line count overlay."
  :group 'hideshow)

(defun ots-hideshow-display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let ((label (format "(%d)..."
                         (count-lines (overlay-start ov)
                                      (overlay-end ov)))))
      (put-text-property 0 (length label) 'face 'hs-overlay-face label)
      (overlay-put ov 'display label))))

;; When called this automatically detects the submode at the current location.
;; It will then either forward to end of tag(HTML) or end of code block(JS/CSS).
;; This will be passed to hs-minor-mode to properly navigate and fold the code.
;; https://stackoverflow.com/a/62502712
(defun ots-hideshow-mhtml-forward (arg)
  (interactive "P")
  (pcase (get-text-property (point) `mhtml-submode)
    (`nil (sgml-skip-tag-forward 1))
    (submode (forward-sexp))))

(add-to-list 'hs-special-modes-alist
             '(mhtml-mode
               "{\\|<[^/>]*?"
               "}\\|</[^/>]*[^/]>"
               "<!--"
               ots-hideshow-mhtml-forward
               nil))

(setq hs-set-up-overlay 'ots-hideshow-display-code-line-counts)

(provide 'ots-hideshow)
;;; ots-hideshow.el ends here
