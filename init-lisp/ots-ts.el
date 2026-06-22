;;; -*- coding: utf-8 -*-
;;; ots-ts.el

(defun ots-ts-set-eglot ()
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

(defun ots-ts-set-properties ()
  "Set properties for editing TypeScript files."
  (setq-local dash-docs-docsets '("JavaScript"))
  (setq-local js-indent-level 2)
  (setq-local tab-width 2)
  (setq-local treesit-font-lock-level 4)
  (setq-local typescript-ts-mode-indent-offset 2)
  (ots-util-bind-key-compile-root (kbd "<f8>") "npx standard ."))

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
