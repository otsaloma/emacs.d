;;; -*- coding: utf-8 -*-
;;; ots-hideshow.el

(defface hs-overlay-face
  '((t (:background "#f0f080" :foreground "#2e3436" :box "#bdbd65")))
  "Face to use for hideshow code line count overlay."
  :group 'hideshow)

(defun ots-hideshow-display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((display-string (format "(%d)..."
                                   (count-lines (overlay-start ov)
                                                (overlay-end ov))))
           (n (length display-string)))
      (put-text-property 0 n 'face 'hs-overlay-face display-string)
      (overlay-put ov 'display display-string))))

(setq hs-set-up-overlay 'ots-hideshow-display-code-line-counts)

(provide 'ots-hideshow)
;;; ots-hideshow.el ends here
