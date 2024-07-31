;;; -*- coding: utf-8 -*-
;;; ots-js.el

(defun ots-js-set-properties ()
  "Set properties for editing JavaScript files."
  (ots-util-add-imenu-expressions
   '((nil "^const +\\([^ ]+\\) += +(.*) +=>", 1)
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
  (setq-local flycheck-checker 'javascript-jshint)
  (setq-local js-indent-level 4)
  (setq-local tab-width 4))

(defun ots-js-set-properties-node ()
  "Set properties for editing Node.js JavaScript files."
  (setq-local dash-docs-docsets '("JavaScript" "Node"))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (setq-local treesit-font-lock-level 4)
  ;; Default to standard, use eslint if corresponding config file found.
  (ots-util-bind-key-compile (kbd "<f8>") "standard %s")
  (setq-local flycheck-checker 'javascript-standard)
  (when (or (ots-util-file-above default-directory ".eslintignore")
            (ots-util-file-above default-directory ".eslintrc.js")
            (ots-util-file-above default-directory ".eslintrc.json")
            (ots-util-file-above default-directory ".eslintrc.yml"))
    (ots-util-bind-key-compile (kbd "<f8>") "eslint %s")
    (setq-local flycheck-checker 'javascript-eslint)))

(defun ots-js-tide ()
  "Set auto-completion via tide."
  (when (eq major-mode 'js-mode)
    (tide-setup)
    (company-mode 1)
    (eldoc-mode 1)
    (flycheck-mode 1)
    (setq-local company-backends '((company-tide
                                    company-keywords
                                    company-dict
                                    company-dabbrev-code
                                    company-dabbrev)))))

(use-package js
  :defer t
  :config
  (add-hook 'js-mode-hook 'ots-js-set-properties)
  (add-hook 'js-mode-hook 'ots-js-tide))

(use-package typescript-ts-mode
  :defer t
  :mode "\\.tsx?\\'"
  :config
  (add-hook 'js-mode-hook 'ots-js-set-properties)
  (add-hook 'js-mode-hook 'ots-js-tide))

(provide 'ots-js)
;;; ots-js.el ends here
