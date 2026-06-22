;;; -*- coding: utf-8 -*-
;;; ots-js.el

(defun ots-js-set-eglot ()
  "Set autocompletion etc. via eglot and a language server."
  ;; https://github.com/typescript-language-server/typescript-language-server
  (eglot-ensure)
  (company-mode 1)
  (eldoc-mode 1)
  (setq-local company-backends '((company-capf
                                  :separate
                                  company-keywords
                                  company-dabbrev-code
                                  company-dabbrev))))

(defun ots-js-set-properties ()
  "Set properties for editing JavaScript files."
  (ots-util-add-imenu-expressions
   '((nil "^const +\\([^ ]+\\) += +(.*) +=>" 1)
     (nil "^function +\\([^(]+\\)(" 1)))
  (if (or (ots-util-file-above default-directory "node_modules")
          (ots-util-file-above default-directory "package.json")
          (ots-util-buffer-contains "\\<\\(exports\\|require\\)\\>"))
      (ots-js-set-properties-node)
    (ots-js-set-properties-browser)))

(defun ots-js-set-properties-browser ()
  "Set properties for editing Browser JavaScript files."
  (ots-util-bind-key-compile (kbd "<f8>") "jshint --reporter=unix %s")
  (setq-local dash-docs-docsets '("JavaScript" "Web"))
  (setq-local js-indent-level 4)
  (setq-local tab-width 4))

(defun ots-js-set-properties-node ()
  "Set properties for editing Node.js JavaScript files."
  (setq-local dash-docs-docsets '("JavaScript"))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (ots-util-bind-key-compile (kbd "<f8>") "npx standard %s"))

(use-package js
  :defer t
  :config
  (add-hook 'js-mode-hook 'ots-js-set-eglot t)
  (add-hook 'js-mode-hook 'ots-js-set-properties))

(provide 'ots-js)
;;; ots-js.el ends here
