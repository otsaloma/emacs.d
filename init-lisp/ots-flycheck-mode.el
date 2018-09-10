;;; -*- coding: utf-8 -*-
;;; ots-flycheck-mode.el

(require 'flycheck)

(flycheck-define-checker r-parse
  "R syntax checker using parse()."
  :command ("r-parse" source)
  :error-patterns ((error line-start "  " (file-name) ":" line ":" column ": " (message) line-end))
  :modes ess-mode)

(add-to-list 'flycheck-checkers 'r-parse)

(setq flycheck-global-modes '(ess-mode python-mode))
(setq-default flycheck-disabled-checkers '(r-lintr))

(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-help-echo-function nil)
(setq flycheck-indication-mode nil)
(setq flycheck-python-flake8-executable "python3")
(setq flycheck-python-pycompile-executable "python3")

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'ots-flycheck-mode)
;;; ots-flycheck-mode.el ends here
