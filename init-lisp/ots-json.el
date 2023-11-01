;;; -*- coding: utf-8 -*-
;;; ots-json.el

(defun ots-json-set-properties ()
  "Set properties for editing JSON files."
  (ots-util-bind-key-compile (kbd "<f8>") "jsonlint %s -cq")
  (setq-local flycheck-checker 'json-jsonlint)
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (turn-off-auto-fill))

(use-package json-mode
  :mode "\\.\\(geojson\\|jshintrc\\)\\'"
  :config
  (add-hook 'json-mode-hook 'ots-json-set-properties))

(provide 'ots-json)
;;; ots-json.el ends here
