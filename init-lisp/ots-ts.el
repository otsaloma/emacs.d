;;; -*- coding: utf-8 -*-
;;; ots-ts.el

(defun ots-ts-set-properties ()
  "Set properties for editing TypeScript files."
  (setq-local dash-docs-docsets '("JavaScript"))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (setq-local treesit-font-lock-level 4)
  (setq-local typescript-ts-mode-indent-offset 2)
  ;; Default to standard, use eslint if corresponding config file found.
  (ots-util-bind-key-compile-root (kbd "<f8>") "npx standard .")
  (setq-local flycheck-checker 'javascript-standard)
  (when (or (ots-util-file-above default-directory ".eslintignore")
            (ots-util-file-above default-directory ".eslintrc.js")
            (ots-util-file-above default-directory ".eslintrc.json")
            (ots-util-file-above default-directory ".eslintrc.yml"))
    (ots-util-bind-key-compile-root (kbd "<f5>") "npx tsc --noEmit --pretty false")
    (ots-util-bind-key-compile-root (kbd "<f8>") "npx eslint .")
    (setq-local flycheck-checker 'javascript-eslint)))

(defun ots-ts-set-eglot ()
  "Set autocompletion etc. via eglot and a language server."
  ;; https://github.com/typescript-language-server/typescript-language-server
  (eglot-ensure)
  (company-mode 1)
  (eldoc-mode 1)
  (setq-local company-backends '((company-capf
                                  :separate
                                  company-keywords
                                  company-dict
                                  company-dabbrev-code
                                  company-dabbrev))))

(use-package typescript-ts-mode
  :defer t
  :mode "\\.ts\\'"
  :config
  (add-hook 'typescript-ts-base-mode-hook 'ots-ts-set-eglot t)
  (add-hook 'typescript-ts-base-mode-hook 'ots-ts-set-properties))

(use-package tsx-ts-mode
  :defer t
  :mode "\\.tsx\\'"
  :config
  (add-hook 'typescript-ts-base-mode-hook 'ots-ts-set-eglot t)
  (add-hook 'typescript-ts-base-mode-hook 'ots-ts-set-properties))

(provide 'ots-ts)
;;; ots-ts.el ends here
