;;; -*- coding: utf-8 -*-
;;; ots-flycheck.el

(use-package flycheck
  :config
  (flycheck-define-checker r-parse
    "R syntax checker using parse()."
    :command ("r-parse" source)
    :error-patterns ((error
                      line-start "  "
                      (file-name) ":"
                      line ":"
                      column ": "
                      (message)
                      line-end))

    :modes ess-r-mode)

  (add-to-list 'flycheck-checkers 'r-parse)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (setq flycheck-global-modes '(ess-r-mode js-mode json-mode python-mode))
  (setq flycheck-help-echo-function nil)
  (setq flycheck-indication-mode nil)
  (setq flycheck-python-flake8-executable "python3")
  (setq flycheck-python-pycompile-executable "python3")
  (setq-default flycheck-disabled-checkers '(python-pylint r-lintr))
  (global-flycheck-mode))

(provide 'ots-flycheck)
;;; ots-flycheck.el ends here
