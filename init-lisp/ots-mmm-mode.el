;;; -*- coding: utf-8 -*-
;;; ots-mmm-mode.el

(require 'mmm-mode)
(require 'mmm-auto)

(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)

;; CSS in HTML

(mmm-add-group
 'html-css
 '((css-block
    :submode css-mode
    :front "<style>"
    :back "</style>")))

(mmm-add-mode-ext-class 'html-mode nil 'html-css)

;; HTML in JavaScript

(mmm-add-group
 'js-html
 '((html-block
    :submode html-mode
    :front "`[\n\t ]*<"
    :back ">[\n\t ]*`")))

(mmm-add-mode-ext-class 'js-mode nil 'js-html)

;; JavaScript in HTML

(mmm-add-group
 'html-js
 '((js-block
    :submode js-mode
    :front "<script>"
    :back "</script>")))

(mmm-add-mode-ext-class 'html-mode nil 'html-js)

(provide 'ots-mmm-mode)
;;; ots-mmm-mode.el ends here
