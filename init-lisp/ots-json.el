;;; -*- coding: utf-8 -*-
;;; ots-json.el

(defun ots-json-set-properties ()
  "Set properties for editing JSON files."
  (ots-util-bind-key-compile (kbd "<f8>") "jsonlint %s -cq")
  (setq-local flycheck-checker 'json-jsonlint)
  (setq-local font-lock-defaults
              (list js--font-lock-keywords nil nil nil nil
                    (cons 'font-lock-syntactic-face-function
                          #'ots-json-syntactic-face)))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (turn-off-auto-fill))

(defun ots-json-syntactic-face (state)
  "Return the font-lock face for the JSON construct at STATE.
Override `js-json-mode' to highlight keys and values different."
  (cond ((nth 3 state)
         (save-excursion
           (goto-char (nth 8 state))
           (if (and (ignore-errors (forward-sexp) t)
                    (looking-at-p "[[:space:]]*:"))
               font-lock-keyword-face
             font-lock-string-face)))
        ((nth 4 state) font-lock-comment-face)))

(use-package js
  :defer t
  :mode ("\\.\\(geojson\\|jshintrc\\|jsonld\\)\\'" . js-json-mode)
  :config
  (add-hook 'js-json-mode-hook 'ots-json-set-properties))

(provide 'ots-json)
;;; ots-json.el ends here
