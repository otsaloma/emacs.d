;;; -*- coding: utf-8 -*-
;;; ots-uniquify.el

(use-package uniquify
  :config
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-ignore-buffers-re "^\\*")
  (setq uniquify-separator "/"))

(provide 'ots-uniquify)
;;; ots-uniquify.el ends here
