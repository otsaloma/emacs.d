;;; -*- coding: utf-8 -*-
;;; ots-helm-dash.el

(require 'helm-dash)

(defun ots-helm-dash-connect ()
  "Make buffer-local connections to docset databases."
  (helm-dash-create-buffer-connections)
  (helm-dash-create-buffer-connections)
  (helm-dash-create-buffer-connections))

(setq helm-dash-browser-func 'browse-url)
(setq helm-dash-docsets-path (expand-file-name "~/.emacs.d/docsets"))
(setq helm-dash-min-length 1)

;; XXX: Search results empty on first call
;; https://github.com/areina/helm-dash/issues/67
(add-hook 'after-change-major-mode-hook 'ots-helm-dash-connect t)

(provide 'ots-helm-dash)
;;; ots-helm-dash.el ends here
