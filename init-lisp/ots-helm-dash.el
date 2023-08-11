;;; -*- coding: utf-8 -*-
;;; ots-helm-dash.el

(use-package helm-dash
  :defer t
  :config
  (setq dash-docs-browser-func 'browse-url)
  (setq dash-docs-docsets-path (expand-file-name "~/.emacs.d/docsets"))
  (setq dash-docs-enable-debugging nil)
  (setq dash-docs-min-length 1))

(provide 'ots-helm-dash)
;;; ots-helm-dash.el ends here
