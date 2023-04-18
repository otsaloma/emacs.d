;;; -*- coding: utf-8 -*-
;;; ots-chatgpt-shell.el

(require 'chatgpt-shell)

(defun ots-chatgpt-shell-set-properties ()
  (require 'olivetti)
  (setq-local fill-column 64)
  (setq-local olivetti-body-width 66)
  (olivetti-mode 1))

;; https://github.com/xenodium/chatgpt-shell
(add-hook 'inferior-chatgpt-mode-hook 'ots-chatgpt-shell-set-properties)
(setq chatgpt-shell-chatgpt-model-version "gpt-3.5-turbo")
(setq chatgpt-shell-chatgpt-streaming t)
(setq chatgpt-shell-openai-key (getenv "OPENAI_API_KEY"))

(provide 'ots-chatgpt-shell)
;;; ots-chatgpt-shell.el ends here
