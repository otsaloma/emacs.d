;;; -*- coding: utf-8 -*-
;;; ots-consult-dash.el

(defun ots-consult-dash--format (candidates)
  "Show each consult-dash candidate as '<docset>  <name>'."
  (dolist (cand candidates candidates)
    (let* ((name (car cand))
           (display (concat (cadr cand) "  " name)))
      (put-text-property 0 (length display) 'consult-dash-docinfo
                         (get-text-property 0 'consult-dash-docinfo name)
                         display)
      (setcar cand display))))

(use-package consult-dash
  :defer t
  :config
  ;; Drop the italic annotation (docset, type, URL columns).
  (advice-add 'consult-dash--annotate :override #'ignore)
  (advice-add 'consult-dash--format :filter-return #'ots-consult-dash--format)
  (consult-customize consult-dash :initial (thing-at-point 'symbol))
  (setq dash-docs-browser-func 'browse-url)
  (setq dash-docs-docsets-path (expand-file-name "~/.emacs.d/docsets"))
  (setq dash-docs-enable-debugging nil)
  (setq dash-docs-min-length 1))

(provide 'ots-consult-dash)
;;; ots-consult-dash.el ends here
