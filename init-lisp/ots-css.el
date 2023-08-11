;;; -*- coding: utf-8 -*-
;;; ots-css.el

(defun ots-css-set-properties ()
  "Set properties for editing CSS files."
  (ots-util-add-imenu-expressions
   '((nil "^\\([^ @\n].*\\) +{" 1)))
  (setq-local css-fontify-colors t)
  (setq-local dash-docs-docsets '("CSS"))
  (setq-local fill-column 80)
  (setq-local tab-width 2))

(use-package css-mode
  :defer t
  :init
  ;; Set globally for <style> elements in HTML files,
  ;; override under css-mode-hook for actual CSS files.
  (setq css-fontify-colors nil)
  (setq css-indent-offset 2)
  :config
  (add-hook 'css-mode-hook 'ots-css-set-properties))

(provide 'ots-css)
;;; ots-css.el ends here
