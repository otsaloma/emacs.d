;;; -*- coding: utf-8 -*-
;;; ots-css.el

(defun ots-css-set-faces ()
  "Set faces for editing CSS files."
  (font-lock-add-keywords
   ;; css-mode seems to have trouble with selectors
   ;; split across multiple lines.
   nil '(("\\[\\(.*\\)=" 1 font-lock-keyword-face)
         ("=\\(.*\\)\\]" 1 font-lock-string-face)
         ("^ *\\([^/].*\\)[{,]$" 1 font-lock-function-name-face))))

(defun ots-css-set-properties ()
  "Set properties for editing CSS files."
  (ots-util-add-imenu-expressions
   '((nil "^\\([^ @\n].*\\) +{" 1)))
  (setq-local fill-column 80)
  (setq-local dash-docs-docsets '("CSS"))
  (setq-local tab-width 2))

(add-hook 'css-mode-hook 'ots-css-set-faces)
(add-hook 'css-mode-hook 'ots-css-set-properties)
(modify-coding-system-alist 'file "\\.css\\'" 'utf-8)

;; Set globally so that will work in HTML files too.
(setq css-fontify-colors nil)
(setq css-indent-offset 2)

(provide 'ots-css)
;;; ots-css.el ends here
