;;; -*- coding: utf-8 -*-
;;; ots-mmm-mode.el

(require 'mmm-mode)
(require 'mmm-auto)

;; We need html-erb-mode to get submode indentation correct.
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-erb-mode))

(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)

;; HTML: CSS <style> block

(mmm-add-group
 'html-css
 '((css-block
    :submode css-mode
    :front "<style[^>]*>[ \t]*\n?"
    :back "[ \t]*</style>")))

(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

;; HTML: JavaScript <script> block

(mmm-add-group
 'html-js
 '((js-block
    :submode js-mode
    :front "<script[^>]*>[ \t]*\n?"
    :back "[ \t]*</script>")))

(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)

;; JavaScript: HTML in template literals

(mmm-add-group
 'js-html
 '((html-block
    :submode html-mode
    :front "`\n[\n\t ]*<"
    :front-offset -1
    :back ">[\n\t ]*`"
    :back-offset 1)))

(mmm-add-mode-ext-class 'js-mode nil 'js-html)

(provide 'ots-mmm-mode)
;;; ots-mmm-mode.el ends here
