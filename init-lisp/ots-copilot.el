;;; -*- coding: utf-8 -*-
;;; ots-copilot.el

(defun ots-copilot-set-properties ()
  "Set properties for GitHub Copilot."
  (define-key copilot-completion-map (kbd "<C-right>") 'copilot-accept-completion-by-line)
  (define-key copilot-completion-map (kbd "<C-down>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "<C-backspace>") 'copilot-clear-overlay)
  (define-key copilot-completion-map (kbd "<C-delete>") 'copilot-clear-overlay))

(use-package copilot
  ;; Specify load-path to work around a jsonrpc error.
  ;; https://github.com/copilot-emacs/copilot.el/issues/204
  :load-path "~/.emacs.d/straight/repos/copilot.el"
  :config
  (when (ots-util-getenv-true "USE_GITHUB_COPILOT")
    (add-hook 'prog-mode-hook 'copilot-mode)
    (add-hook 'copilot-mode-hook 'ots-copilot-set-properties)))

(provide 'ots-copilot)
;;; ots-copilot.el ends here
