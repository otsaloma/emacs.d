;;; -*- coding: utf-8 -*-
;;; ots-yasnippet.el

(require 'yasnippet)

(setq yas/root-directory '("~/.emacs.d/snippets"))
(setq yas/trigger-key "C-+")
(setq yas/trigger-symbol "+")

;; Allow snippets in comments too (e.g. coding magic line).
(add-hook 'after-change-major-mode-hook
          '(lambda () (setq yas/buffer-local-condition
                            '(require-snippet-condition . t))))

(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(provide 'ots-yasnippet)
;;; ots-yasnippet.el ends here
