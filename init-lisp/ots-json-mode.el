;;; -*- coding: utf-8 -*-
;;; ots-json-mode.el

(require 'ots-js-mode)

(autoload 'ots-json-mode "json" "Edit JSON files." t)
(let ((modes '(("\\.json$" . ots-json-mode))))
  (setq auto-mode-alist (append modes auto-mode-alist)))

(define-derived-mode ots-json-mode js-mode "JSON"
  "Mode for editing JSON files."
  (setq major-mode 'ots-json-mode mode-name "JSON")
  (run-hooks 'ots-json-mode-hook))

(defun ots-json-mode-set-properties ()
  "Set properties for editing JSON files."
  (setq fill-column 1000)
  (turn-off-auto-fill))

(add-hook 'ots-json-mode-hook 'ots-json-mode-set-properties)

(provide 'ots-json-mode)
;;; ots-json-mode.el ends here