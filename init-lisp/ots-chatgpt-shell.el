;;; -*- coding: utf-8 -*-
;;; ots-chatgpt-shell.el

(require 'chatgpt-shell)

;; https://github.com/xenodium/chatgpt-shell
(setq chatgpt-shell-chatgpt-model-version "gpt-3.5-turbo")
(setq chatgpt-shell-chatgpt-streaming t)
(setq chatgpt-shell-openai-key (getenv "OPENAI_API_KEY"))

(provide 'ots-chatgpt-shell)
;;; ots-chatgpt-shell.el ends here
