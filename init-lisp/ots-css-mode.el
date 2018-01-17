;;; -*- coding: utf-8 -*-
;;; ots-css-mode.el

(defun ots-css-mode-set-faces ()
  "Set faces for editing CSS files."
  (font-lock-add-keywords
   ;; css-mode seems to have trouble with selectors
   ;; split across multiple lines.
   nil '(("\\[\\(.*\\)=" 1 font-lock-keyword-face)
         ("=\\(.*\\)\\]" 1 font-lock-string-face)
         ("^ *\\([^/].*\\)[{,]$" 1 font-lock-function-name-face))))

(defun ots-css-mode-set-properties ()
  "Set properties for editing CSS files."
  (ots-util-add-imenu-expressions
   '((nil "^\\([^ @\n].*\\) +{" 1)))
  (setq-local company-backends
   '((company-css company-keywords company-dabbrev-code)
     (company-dabbrev)))
  (setq-local css-indent-offset 2)
  (setq-local fill-column 80)
  (setq-local helm-dash-docsets '("CSS"))
  (setq-local tab-width 2))

(add-hook 'css-mode-hook 'ots-css-mode-set-faces)
(add-hook 'css-mode-hook 'ots-css-mode-set-properties)
(modify-coding-system-alist 'file "\\.css\\'" 'utf-8)
(setq css-indent-offset 2)

(provide 'ots-css-mode)
;;; ots-css-mode.el ends here
